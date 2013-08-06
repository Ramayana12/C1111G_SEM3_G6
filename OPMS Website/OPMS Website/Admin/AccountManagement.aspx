<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="AccountManagement.aspx.cs" Inherits="OPMS_Website.Admin.AccountManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li class="current"><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li><a href="NewsManagement.aspx">NEWS</a></li>
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
                <legend class="legend" style="width: 54px">SEARCH</legend>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" Width="150px" AutoPostBack="True" OnTextChanged="txtUserName_TextChanged" ToolTip="Input FullName or Username"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Label ID="Label3" runat="server" Text="Role :"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlRole" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                    <asp:ListItem Text="------Select Role-------" Value=""></asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Administrator</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Branch:"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddlBranches" runat="server" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlBranches_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp;<br />
                <br />
                <br />
                &nbsp;



                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" ForeColor="#0000C0" Text="Total Recod:"></asp:Label>
                <asp:Label
                    ID="lblTotalRecord" runat="server" ForeColor="#404000"></asp:Label>
                <br />
                <asp:GridView ID="gvAccountsList" runat="server" AutoGenerateColumns="false" AllowPaging="True" AllowSorting="True" PageSize="15" OnPageIndexChanging="gvAccountsList_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Full name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetails" CommandArgument='<%# Eval("ID") %>'
                                    Text='<%# Eval("FullName") %>'
                                    runat="server" ToolTip="View Details Profile Account"
                                    OnCommand="lbtnDetails_Command"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblRole"
                                    Text='<%# Eval("Role") %>' Enabled="True" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Active">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbActive" runat="server" Enabled="false" Checked='<%# Eval("Active").ToString().Equals("True") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete"
                                    CommandArgument='<%# Eval("ID") %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this record ?')"
                                    runat="server" ToolTip="Remove  Account" CommandName="RemoveAccount"
                                    OnCommand="lbtnDelete_Command"><%# Eval("ID").Equals(Session["AccountID"]) ? "" : "Remove" %></asp:LinkButton>&nbsp;&nbsp;
                                    &nbsp;
                                <asp:LinkButton ID="lbtnDeactivate"
                                    CommandArgument='<%# Eval("ID") %>' runat="server"
                                    OnClientClick="return confirm('Are you sure you want to change Status this account ?')"
                                    ToolTip='<%# (Eval("Active").ToString().Equals("False")) ? "Active Account" : "Deactivate Account" %>'
                                    CommandName="DeactivateAccount"
                                    OnCommand="lbtnDeactivate_Command"><%# Eval("Role").Equals("Employee") ? ((Eval("Active").Equals("False")) ? "Active" : "Deactivate") : "" %></asp:LinkButton>
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
