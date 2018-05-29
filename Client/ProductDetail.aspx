<%@ Page Title="" Language="C#" MasterPageFile="~/Client1.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="Client_ProductDetail" %>

<%@ Register assembly="Media-Player-ASP.NET-Control" namespace="Media_Player_ASP.NET_Control" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("You must Login First")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }

    </script>
    <style type="text/css">
        #video {
            height: 473px;
            width: 1186px;
            margin-left: 57px;
        }
        #audio {
            width: 1254px;
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="position:relative; top: -11px; left: -5px; height: 3000px; width: 1368px; background-image: url('../Textures/textureforclient5.JPG');">
        <asp:Panel ID="Panel1" runat="server" Height="39px">
            <audio id="audio" runat="server" controls="controls" loop="loop" autoplay="autoplay"><source type="audio/mp3" src='<%= Clients() %>'/><source type="audio/mp4" src='<%= Clients() %>'/><source type="audio/ogg" src='<%= Clients() %>'/><source type="audio/vnd.rn-realaudio" src='<%= Clients() %>'/><source type="audio/vnd.wave" src='<%= Clients() %>'/><source type="audio/vorbis" src='<%= Clients() %>'/><source type="audio/x-ms-wma" src='<%= Clients() %>'/></audio>
        </asp:Panel>
        <br />       
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Forte" Font-Size="25pt" ForeColor="#951102" Text="Name : "></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Forte" Font-Size="25pt" ForeColor="#951102" Text="Name : "></asp:Label>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Forte" Font-Size="25pt" ForeColor="#951102" Text="Description : "></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" BackColor="#3EB1FF" Font-Bold="True" Font-Names="Arial Black" Font-Size="15pt" ForeColor="Yellow" Height="136px" TextMode="MultiLine" Width="596px"></asp:TextBox>
        <br />
        <br />

    </div>
</asp:Content>

