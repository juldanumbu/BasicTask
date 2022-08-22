// namespace BasicTask;

using System.Text.Json;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

public class Customer
{
    public int id { get; set; }
    public string name { get; set; }
}

public class Item
{
    public int id { get; set; }
    public string name { get; set; }
    public int qty { get; set; }
    public int price { get; set; }
}

public class Order
{
    public string order_id { get; set; }
    public DateTime created_at { get; set; }
    public Customer customer { get; set; }
    public List<Item> items { get; set; }
}

class Program
{
    static void Main(string[] args)
    {
        var orders = new List<Order>
        {
            {
                new Order()
                {
                    order_id = "SO-921",
                    created_at = DateTime.Parse("2018-02-17T03:24:12"),
                    customer = new Customer() { id = 33, name = "Ari" },
                    items = new List<Item>
                    {
                        {
                            new Item()
                            {
                                id = 24,
                                name = "Sapu Lidi",
                                qty = 2,
                                price = 13200
                            }
                        },
                        {
                            new Item()
                            {
                                id = 73,
                                name = "Sprei 160x200 polos",
                                qty = 1,
                                price = 149000
                            }
                        },
                    },
                }
            },
            {
                new Order()
                {
                    order_id = "SO-922",
                    created_at = DateTime.Parse("2018-02-20T13:10:32"),
                    customer = new Customer() { id = 40, name = "Ririn" },
                    items = new List<Item>
                    {
                        {
                            new Item()
                            {
                                id = 83,
                                name = "Rice Cooker",
                                qty = 1,
                                price = 258000
                            }
                        },
                        {
                            new Item()
                            {
                                id = 24,
                                name = "Sapu Lidi",
                                qty = 1,
                                price = 13200
                            }
                        },
                        {
                            new Item()
                            {
                                id = 30,
                                name = "Teflon",
                                qty = 1,
                                price = 190000
                            }
                        },
                    }
                }
            },
            {
                new Order()
                {
                    order_id = "SO-926",
                    created_at = DateTime.Parse("2018-03-05T16:23:20"),
                    customer = new Customer() { id = 58, name = "Annis" },
                    items = new List<Item>
                    {
                        new Item()
                        {
                            id = 24,
                            name = "Sapu Lidi",
                            qty = 3,
                            price = 13200
                        }
                    }
                }
            },
            {
                new Order()
                {
                    order_id = "SO-925",
                    created_at = DateTime.Parse("2018-03-03T14:52:22"),
                    customer = new Customer() { id = 33, name = "Ari" },
                    items = new List<Item>
                    {
                        {
                            new Item()
                            {
                                id = 1033,
                                name = "Nintendo Switch",
                                qty = 1,
                                price = 4990000
                            }
                        },
                        {
                            new Item()
                            {
                                id = 2003,
                                name = "Macbook Air 11 inch 128 GB",
                                qty = 1,
                                price = 12000000
                            }
                        },
                        {
                            new Item()
                            {
                                id = 23,
                                name = "Pocari Sweat 600ML",
                                qty = 5,
                                price = 7000
                            }
                        },
                    },
                }
            }
        };

        //FindAll purchase in February
        Console.WriteLine("No. 1");

        var result = orders.Where(item => item.created_at.Month == 02);
        Console.WriteLine(JsonSerializer.Serialize(result));

        Console.WriteLine();

        //FindALl grand total of Ari
        Console.WriteLine("No. 2");
        var results = orders.Where(item => item.customer.name == "Ari");
        var price = results.Select(item => item.items.Select(item => item.price));
        var quantity = results.Select(item => item.items.Select(item => item.qty));

        // Console.WriteLine(JsonSerializer.Serialize(price));
        // Console.WriteLine(JsonSerializer.Serialize(quantity));

        List<int> grand_total = new List<int>();

        for (int i = 0; i < price.Count(); i++)
        {
            for (int j = 0; j < price.ElementAt(i).Count(); j++)
            {
                int total = price.ElementAt(i).ElementAt(j) * quantity.ElementAt(i).ElementAt(j);
                grand_total.Add(total);
            }
        }
        // grand_total.Sum();

        Console.WriteLine(JsonSerializer.Serialize(grand_total.Sum()));

        Console.WriteLine();

        //FindAll grand total under 300000
        Console.WriteLine("No. 3");
        string[] names = { "Annis", "Ari", "Ririn" };

        foreach (string name in names)
        {
            var result_s = orders.Where(item => item.customer.name == name);
            var price_s = result_s.Select(item => item.items.Select(item => item.price));
            var quantity_s = result_s.Select(item => item.items.Select(item => item.qty));

            List<string> grand_total_all = new List<string>();
            List<int> grand_total_s = new List<int>();

            for (int i = 0; i < price_s.Count(); i++)
            {
                for (int j = 0; j < price_s.ElementAt(i).Count(); j++)
                {
                    int total_s =
                        price_s.ElementAt(i).ElementAt(j) * quantity_s.ElementAt(i).ElementAt(j);
                    grand_total_s.Add(total_s);
                }
            }
            int total_per_person = grand_total_s.Sum();
            if (total_per_person < 300000)
            {
                grand_total_all.Add(name);
            }

            Console.WriteLine(JsonSerializer.Serialize(grand_total_all));

            Console.WriteLine();
        }
    }
}
