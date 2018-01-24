using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTester
{
    class Program
    {
        static void Main(string[] args)
        {
            //Common com = new Common();
            using (var db = new Common.ExpensesV2Entities())
            {
                /*var query = from Common.Accounts in db.Accounts
                            select Common.Accounts.Banks;*/
                var query = from Accounts in db.Accounts
                            select Accounts.Banks.Description;

                foreach (var item in query)
                {
                    Console.WriteLine("->" + item);
                }
                Console.ReadLine();
            }
        }
    }
}
