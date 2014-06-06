using NUnit.Framework;
using NUnit.Core;

namespace SeleniumTests
{
    public class NextStep
    {
        [Suite] public static TestSuite Suite
        {
            get
            {
                TestSuite suite = new TestSuite("NextStep");
                suite.Add(new Navigation());
                suite.Add(new FindProducts - All());
                suite.Add(new FindProducts - Nike());
                suite.Add(new FindProducts - Category());
                suite.Add(new Contact());
                return suite;
            }
        }
    }
}
