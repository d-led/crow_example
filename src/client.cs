using System;
using System.Net;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Threading;

class Client
{
    public static void Main(string[] args)
    {
        var r = new Random();
        Func<int> next = () => r.Next(0, 100);

        var sw = new Stopwatch();
        using (var client = new ThreadLocal<WebClient>(() => new WebClient()))
        {
            sw.Start();
            Parallel.For(0, 1000, (i) =>
            {
                int a = next(), b = next();
                var res = client.Value.DownloadString($"http://localhost:18080/add/{a}/{b}");

                if (i % 100 == 0)
                {
                    Console.WriteLine($"{a}+{b}={res} (tid:{System.Threading.Thread.CurrentThread.ManagedThreadId})");
                }
            });
        }

        Console.WriteLine($"{1000 / sw.Elapsed.TotalSeconds} req/s");
    }
}
