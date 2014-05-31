using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>

public class ShoppingCart
{
    private ArrayList _cartItems;
    private int _shoppingOrderId;

    public IEnumerable CartItems
    {
        get
        {
            return _cartItems;
        }
    }

    public int Count
    {
        get
        {
            return _cartItems.Count;
        }
    }

    public int ShoppingOrderId
    {
        get
        {
            return _shoppingOrderId;
        }
        set
        {
            _shoppingOrderId = value;
        }
    }
    
	public ShoppingCart()
	{
        //create a new empty ArrayList
        _cartItems = new ArrayList();
	}

    /// <summary>
    /// Add an item to the shopping cart.
    /// If the item already exists update the item quantity
    /// If the item does not exist insert it into the shopping cart
    /// </summary>
    /// <param name="item">Shopping cart item</param>
    public void AddItem(CartItem item)
    {
        //check if item exists
        if (Exists(item))
        {
            //item already exists update quantity
            UpdateItem(item);
        }
        else
        {
            //item does not exist insert new item
            InsertItem(item);
        }
        
    }

    /// <summary>
    /// Update shopping cart item quantity
    /// </summary>
    /// <param name="item"></param>
    public void UpdateItem(CartItem item)
    {
        //loop through shopping cart to find the 
        //item that needs to be updated
        foreach (CartItem ciProduct in _cartItems)
        {
            //if the productID of current cart item
            //equals the product ID passed in this is
            //the item to update
            if (ciProduct.ProductID == item.ProductID)
            {
                ciProduct.Quantity += item.Quantity;
            }
        }
    }

    /// <summary>
    /// Insert item into shoping cart
    /// </summary>
    /// <param name="item"></param>
    private void InsertItem(CartItem item)
    {
        //insert an item to the cart
        _cartItems.Add(item);
    }

    /// <summary>
    /// Remove an item from shopping cart
    /// </summary>
    /// <param name="item"></param>
    public void RemoveItem(CartItem item)
    {
        //remove item from cart
        int intIndex;

        intIndex = FindItem(item);
        

        if (intIndex >= 0)
        {
            _cartItems.RemoveAt(intIndex);
        }
    }

    /// <summary>
    /// Calculate total of shopping cart
    /// </summary>
    /// <returns>Total cost of shopping cart</returns>
    public double CalculateTotal()
    {
  
        double dblTotal = 0.0;

        //loop through shopping cart
        foreach (CartItem ciProduct in _cartItems)
        {
            dblTotal += (double)ciProduct.Price * ciProduct.Quantity;
        }
        return dblTotal;
    }

    /// <summary>
    /// Save cart to database and all cart items
    /// </summary>
    public void SaveCart()
    {
        string strConnection;
        strConnection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //create connection object get connection string from private 
        //variable _Conn
        SqlConnection objConnection = new SqlConnection(strConnection);

        //create command object
        SqlCommand objCommand = new SqlCommand("InsertOrderItem", objConnection);
        objCommand.CommandType = CommandType.StoredProcedure;

        //open database connection
        objConnection.Open();
        foreach (CartItem ciProduct in _cartItems)
        {
            objCommand.Parameters.AddWithValue("@ShoppingOrderId", ShoppingOrderId);
            objCommand.Parameters.AddWithValue("@ItemId", ciProduct.ProductID);
            objCommand.Parameters.AddWithValue("@Quantity", ciProduct.Quantity);
            objCommand.Parameters.AddWithValue("@Price", ciProduct.Price);
            
            //Execute stored procedure
            objCommand.ExecuteNonQuery();

            //clear parameters
            objCommand.Parameters.Clear();
        }
        //close database connection
        objConnection.Close();
    }
    //public void SaveCart()
    //{
        
    //    //insert orderItems
    //    SqlParameter[] itemParams;
      

    //    itemParams = new SqlParameter[4];


    //    itemParams[0] = new SqlParameter("@ItemId", SqlDbType.Int);
    //    itemParams[1] = new SqlParameter("@Price", SqlDbType.Money);
    //    itemParams[2] = new SqlParameter("@Quantity", SqlDbType.Int);
    //    itemParams[3] = new SqlParameter("@ShoppingOrderId", SqlDbType.Int);

    //    //add a new row for each item ordered
    //    foreach (CartItem ciProduct in _cartItems)
    //    {
    //        itemParams[0].Value = ciProduct.ProductID;
    //        itemParams[1].Value = ciProduct.Price;
    //        itemParams[2].Value = ciProduct.Quantity;
    //        itemParams[3].Value = ShoppingOrderId;

    //        ExecuteStoredProcedure("InsertOrderItem", itemParams, false);
    //    }
    //}

    //public void UpdatePayment(bool paid)
    //{
    //    //credit card payment has gone through set the paid field to true/false
    //    SqlParameter[] payParams;


    //    payParams = new SqlParameter[2];


    //    payParams[0] = new SqlParameter("@ShoppingOrderId", SqlDbType.Int);
    //    payParams[1] = new SqlParameter("@Payment", SqlDbType.Bit);

    //    payParams[0].Value = ShoppingOrderId;
    //    payParams[1].Value = paid;

    //    ExecuteStoredProcedure("SetPayment", payParams, false);
    //}


    //private int ExecuteStoredProcedure(string StoredProcedure, SqlParameter[] parameters, bool returnValue)
    //{
    //    string strConnection;
    //    strConnection = ConfigurationManager.ConnectionStrings["onlineStore"].ConnectionString;

    //    //create connection object get connection string from private 
    //    //variable _Conn
    //    SqlConnection objConnection = new SqlConnection(strConnection);

    //    //create command object
    //    SqlCommand objCommand = new SqlCommand(StoredProcedure, objConnection);
    //    objCommand.CommandType = CommandType.StoredProcedure;

    //    //for each parameter passed in add it to the commad object
    //    //parameters collection
    //    for (int i = 0; i < parameters.Length; i++)
    //    {
    //        objCommand.Parameters.Add(parameters[i]);
    //    }

    //    int intReturn = -1;

    //    //open database connection
    //    objConnection.Open();

    //    if (returnValue == true)
    //    {
    //        //execute SQL 
    //        intReturn = int.Parse(objCommand.ExecuteScalar().ToString());
    //    }
    //    else
    //    {
    //        intReturn = objCommand.ExecuteNonQuery();
    //    }
        
    //    //close connection
    //    objConnection.Close();
    //    //clear paremeters

    //    objCommand.Parameters.Clear();
       

    //    return intReturn;
    //}

    /// <summary>
    /// Returns the location of an item
    /// in the shopping cart
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    private int FindItem(CartItem item)
    {
        int intIndex = 1;
        CartItem ciProduct;
      
        //loop through shopping cart
        for (int i = 0; i < _cartItems.Count; i++)
        {
            ciProduct = (CartItem)_cartItems[i];
            if (ciProduct.ProductID == item.ProductID)
            {
                intIndex = i;
            }
        }
        return intIndex;
    }

    /// <summary>
    /// Checks if the item exists in the shopping cart
    /// </summary>
    /// <param name="item"></param>
    /// <returns>true/false</returns>
    private bool Exists(CartItem item)
    {
        bool bolFound = false;

        //loop through shopping cart
        foreach (CartItem ciProduct in _cartItems)
        {
            if (ciProduct.ProductID == item.ProductID)
            {
                bolFound = true;
            }
        }

        return bolFound;
    }
}
