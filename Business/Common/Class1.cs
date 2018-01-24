using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class Class1
    {

        static void Main(string[] args)
        {
            using (var db = new Common.ExpensesV2Entities())
            {
                var query = from x in db.Accounts
                            orderby x.id
                            select x;

                foreach (var item in query)
                {
                    Console.WriteLine(item.id + "-" + item.CodCurrency + "-" + item.CodAccountType);
                }


            }
        }
    }
}
