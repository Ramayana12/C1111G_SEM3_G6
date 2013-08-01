<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="BranchManagement.aspx.cs" Inherits="OPMS_Website.Admin.BranchManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="frmHome.aspx">HOME</a></li>
            <li class="current"><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="frmAccountsManagement.aspx">USERS</a></li>
            <li><a href="frmServicesManagement.aspx">MANAGEMENT</a></li>
            <li><a href="frmNewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="BranchCreate.aspx" class="addorder">New Branch</a></li>
            <li><a href="BranchManagement.aspx" class="folder_table">List Branches</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Branches Management</h3>
        <div id="Div1" class="form" runat="server">
            <fieldset id="personal" class="form" style="text-align: left">
                <legend class="legend">SEARCH</legend>&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Branch Name:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtBranchName" runat="server" Width="210px" AutoPostBack="True" OnTextChanged="txtBranchName_TextChanged"></asp:TextBox>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
               
                &nbsp;
                <br />
                <br />
            </fieldset>
            <br />
            <fieldset id="personal1" class="form" style="text-align: left">
                <legend class="legend">&nbsp;&nbsp; RESULT</legend>&nbsp;<asp:LinkButton ID="lbtCreateNewBranch" runat="server" OnClick="lbtCreateNewBranch_Click">Create New Branch</asp:LinkButton>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label2" runat="server" ForeColor="#0000C0" Text="Total Records:"></asp:Label><asp:Label
                    ID="lblTotalRecord" runat="server" ForeColor="#404000"></asp:Label><br />
                <br />
                <asp:GridView ID="gvBranchList" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="15" OnPageIndexChanging="grwBranchList_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtDelete" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this record ?')"
                                    ToolTip="Delete Branch" CommandName="DeleteBranch" OnCommand="lbtDelete_Command">Remove</asp:LinkButton>&nbsp; &nbsp;
                                <asp:LinkButton ID="lbtViewDetails" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    ToolTip="View Branch Details" CommandName="ViewDetailsBranch" OnCommand="lbtViewDetails_Command">View Details</asp:LinkButton>&nbsp;
                                &nbsp;<asp:LinkButton ID="lbtViewEmployees" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    ToolTip="View Account Details" CommandName="ViewEmployees" OnCommand="lbtViewEmployees_Command">View Employees</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                &nbsp;<br />
                &nbsp;
                <asp:Label ID="lblEmployee" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label><br />
                <br />
                <asp:GridView ID="gvEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    PageSize="15" Visible="False" OnPageIndexChanging="grwEmployee_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    </Columns>
                </asp:GridView>
            </fieldset>
        </div>
    </div>
</asp:Content>
