<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="AccountManagement.aspx.cs" Inherits="OPMS_Website.Admin.AccountManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="frmHome.aspx">HOME</a></li>
            <li ><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li class="current"><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="frmServicesManagement.aspx">MANAGEMENT</a></li>
            <li><a href="frmNewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="AccountCreate.aspx" class="useradd">Add user</a></li>
            <li><a href="AccountManagement.aspx" class="search">Find user</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Account Management</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left">
                <legend class="legend" style="width: 54px">SEARCH</legend>&nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="UserName: "></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" Width="210px" AutoPostBack="True" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
                &nbsp; 
                <br />
                <br />
                &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Full Name: "></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" Width="210px" AutoPostBack="True" OnTextChanged="txtFullName_TextChanged"></asp:TextBox>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                &nbsp; &nbsp; &nbsp;&nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label5" runat="server" Text="Branch:"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlBranches" runat="server" Width="217px" AutoPostBack="True" OnSelectedIndexChanged="ddlBranches_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;<br />
                &nbsp;
            </fieldset>
            <br />
            <fieldset id="Fieldset1" class="form" style="text-align: left">
                <legend class="legend" style="width: 54px">RESULT</legend>&nbsp;<asp:LinkButton ID="LinkButton1"
                    runat="server" PostBackUrl="~/Admin/AccountCreate.aspx">Create New Account</asp:LinkButton>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label2" runat="server" ForeColor="#0000C0" Text="Total Recod:"></asp:Label>
                <asp:Label
                    ID="lblTotalRecord" runat="server" ForeColor="#404000"></asp:Label><br />
                <br />
                <asp:GridView ID="gvAccountsList" runat="server" AutoGenerateColumns="false" AllowPaging="True" AllowSorting="True" PageSize="15" OnPageIndexChanging="gvAccountsList_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Full name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnProfileAccount" CommandArgument='<%# Eval("ID") %>'
                                    Text='<%# Eval("FullName") %>'
                                    runat="server" ToolTip="Profile Account"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnViewUser"
                                    CommandArgument='<%# Eval("ID") %>'
                                    Text='<%# Eval("UserName") %>'
                                    runat="server" ToolTip="View Account Details"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblRole"
                                    Text='<%# Eval("Role") %>' Enabled="True" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete"
                                    CommandArgument='<%# Eval("ID") %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this record ?')"
                                    runat="server" ToolTip="Remove  Account" CommandName="RemoveAccount"
                                    OnCommand="lbtnDelete_Command">Remove</asp:LinkButton>&nbsp;
                                    &nbsp;
                                <asp:LinkButton ID="lbtnDetails"
                                    CommandArgument='<%# Eval("ID") %>'
                                    runat="server" ToolTip="View Account Details" CommandName="ViewAccountDetails"
                                    OnCommand="lbtnDetails_Command">View Details</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                &nbsp;
            </fieldset>
        </div>
    </div>
</asp:Content>
