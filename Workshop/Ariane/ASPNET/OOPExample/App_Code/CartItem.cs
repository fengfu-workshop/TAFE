using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    private string _itemName;
    private int _quantity;
    private double _price;
    private int _productID;

    public string ItemName
    {
        get
        {
            return _itemName;
        }
        set
        {
            _itemName = value;
        }
    }

    public int Quantity
    {
        get
        {
            return _quantity;
        }
        set
        {
            _quantity = value;
        }
    }

    public double Price
    {
        get
        {
            return _price;
        }
        set
        {
            _price = value;
        }
    }

    public int ProductID
    {
        get
        {
            return _productID;
        }
        set
        {
            _productID = value;
        }
    }


    public CartItem()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
