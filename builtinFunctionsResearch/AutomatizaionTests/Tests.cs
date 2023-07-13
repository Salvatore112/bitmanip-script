namespace AutomatizaionTests;

public class Tests
{
    string path = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.Parent.FullName;

    [Test]
    public void clzwShouldBePresent()
    {
        string clzwAssembly = File.ReadAllText(path + "\\sFiles\\clzw.s");
        Assert.That(clzwAssembly.Contains("clzw"));
    }

    [Test]
    public void cpopwShouldBePresent()
    {
        string cpopwAssembly = File.ReadAllText(path + "\\sFiles\\cpopw.s");
        Assert.That(cpopwAssembly.Contains("cpopw"));
    }
    
    [Test]
    public void ctzwShouldBePresent()
    {
        string ctzwAssembly = File.ReadAllText(path + "\\sFiles\\ctzw.s");
        Assert.That(ctzwAssembly.Contains("ctzw"));
    }

    [Test]
    public void rev8ShouldBePresent()
    {
        string rev8Assembly = File.ReadAllText(path + "\\sFiles\\rev8.s");
        Assert.That(rev8Assembly.Contains("rev8"));
    }
}