using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            var x = new Test.Class1("Data Source=dvassrrpt;Initial Catalog=assessor_app;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;".Replace("Provider=SQLNCLI11.1;", "").Replace("Auto Translate=False;", ""));

                                     ;

            x.doWork();
        }
    }
}
