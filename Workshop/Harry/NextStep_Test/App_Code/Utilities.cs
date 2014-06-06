using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    public string ItemId { get; set; }
    public string ItemName { get; set; }
    public double Price { get; set; }
    public string PhotoGuid { get; set; }
    public int Quantity { get; set; }
    public string Description { get; set; }
    public string CategoryId { get; set; }
    public double SubTotal { get; set; }
}

public class ShoppingCart
{
    Dictionary<string, Product> cart = new Dictionary<string, Product>();
    public void AddProduct(Product prd, int number = 1)
    {
        if (HasKey(prd.ItemId))
        {
            Products[prd.ItemId].Quantity += number;
            Products[prd.ItemId].SubTotal += prd.Price * number;
        }
        else
        {
            prd.Quantity = number;
            prd.SubTotal = prd.Price * number; 
            cart.Add(prd.ItemId, prd);
        }
    }

    public void AddProduct(string item_id, int number = 1)
    {
        Products[item_id].Quantity += number;
        Products[item_id].SubTotal += Products[item_id].Price * number;
    }

    public void RemoveProduct(string item_id, int number = 0)
    {
        if (HasKey(item_id))
        {
            Products[item_id].Quantity -= number;
            Products[item_id].SubTotal -= Products[item_id].Price * number;

            if (number == 0 || Products[item_id].Quantity == 0)
                cart.Remove(item_id);
        }
    }

    public void ClearProducts()
    {
        cart.Clear();
    }
     
    public bool HasKey(string key) 
    {
        return Products.ContainsKey(key);
    }   

    public int Count { get {return cart.Count;} }
    public Dictionary<string, Product> Products { get { return cart; } }
    public int TotalProducts()
    {
        int sum = 0;
        foreach (KeyValuePair<string, Product> item in Products)
        {
            sum += item.Value.Quantity;
        }
        return sum;
    }

    public double TotalPrice()
    {
        double sum = 0;
        foreach (KeyValuePair<string, Product> item in Products)
        {
            sum += (item.Value.Quantity * item.Value.Price);
        }
        return sum;
    }

}

public class CreditCard
{
    public string CardNo { get; set; }
    public DateTime ExpiryDate { get; set; }
    public string NameOnCard { get; set; }
}

public class CardList
{
    Dictionary<string, CreditCard> cards;

    public CardList()
    {
        cards = new Dictionary<string, CreditCard>();
        GetCardList();
    }

    public void AddCard(string cardNo, DateTime expiryDate, string name)
    {
        CreditCard card = new CreditCard();
        card.CardNo = cardNo;
        card.ExpiryDate = expiryDate;
        card.NameOnCard = name;
        cards.Add(cardNo, card);
    }

    public bool HasCard(string cardNo)
    {
        return cards.ContainsKey(cardNo);
    }

    public bool ValidCard(string cardNo, DateTime expiryDate, string name)
    {
        return HasCard(cardNo) && (cards[cardNo].ExpiryDate == expiryDate) && (cards[cardNo].NameOnCard == name);
    }

    public void ClearCards()
    {
        cards.Clear();
    }

    public void GetCardList()
    {
        SqlDataSource srcCreditCard;
        srcCreditCard = new SqlDataSource();
        srcCreditCard.ConnectionString = WebConfigurationManager.ConnectionStrings["NextStepConnectionString"].ConnectionString;

        srcCreditCard.SelectCommand = "SELECT * FROM CreditCard";

        //srcCreditCard.DataSourceMode = SqlDataSourceMode.DataSet;

        DataView dv = (DataView)srcCreditCard.Select(DataSourceSelectArguments.Empty);
        int nRecords = (int)dv.Table.Rows.Count;
        for (int i = 0; i < nRecords; i++)
        {
            this.AddCard((string)dv.Table.Rows[i][0], (DateTime)dv.Table.Rows[i][1], (string)dv.Table.Rows[i][2]);
        }
        srcCreditCard.Dispose();
    }
}

public static class GlobalVar
{
    //public static ShoppingCart Cart;
    public static CardList ValidCards;
}
