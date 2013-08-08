<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="FeedBackManagement.aspx.cs" Inherits="OPMS_Website.Admin.FeedBackManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li class="current"><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="NewsManagement.aspx" class="newAdd">News</a></li>
            <li><a href="FeedBackManagement.aspx" class="feedback">Feeb Back</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div id="box">
        <h3>Feedbacks Management</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left;">
                <legend class="legend">FEEDBACKS INFORMATION</legend>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp;<asp:Label ID="Label1" runat="server" Text="Name :" ToolTip="Full Name"></asp:Label>
                &nbsp; &nbsp;<asp:TextBox ID="txtSearch" runat="server" Width="196px" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" ToolTip="Name"></asp:TextBox>
                <br />
                <br />
                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="Total FeedBacks :"></asp:Label>
                <asp:Label ID="lblTotalReport" runat="server"></asp:Label>
                <br />
                <asp:GridView ID="gvFeedBack" runat="server" AllowPaging="True" AutoGenerateColumns="False" HorizontalAlign="Center" PageSize="15" OnPageIndexChanging="gvFeedBack_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Full name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField HeaderText="Send date">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Convert.ToDateTime(Eval("CreateDate")).ToShortDateString() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTION">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="delete" OnCommand="lbtnDelete_Command" ToolTip="Delete News"
                                    OnClientClick="return confirm('Are you sure you want to delete this record ?')">Remove</asp:LinkButton>
                                &nbsp; &nbsp;<asp:LinkButton ID="lbtnViewDetails" runat="server" ToolTip="View Details News information" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="detail" OnCommand="lbtnViewDetails_Command"> View Details</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </fieldset>
        </div>
    </div>
</asp:Content>
