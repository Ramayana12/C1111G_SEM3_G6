<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Employee/masterPageEmployee.Master" AutoEventWireup="true" CodeBehind="OrderCreate.aspx.cs" Inherits="OPMS_Website.Employee.OrderCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeEmployee.aspx">HOME</a></li>
            <li class="current"><a href="OrderManagement.aspx">ORDERS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="box">
        <h3>New Order</h3>
        <div class="form" runat="server" id="Div1">
            <asp:Panel ID="_pnlMailCustomer" runat="server" Width="710px">
                <fieldset id="Fieldset1" class="form" style="text-align: left">
                    <legend class="legend" style="width: 85px">SENDER INFORMATION</legend>&nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Sender Name:"></asp:Label>
                    <asp:TextBox ID="txtSenderName" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSenderName"
                        ErrorMessage="Sender Name is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server"
                        Text="Phone:"></asp:Label>
                    <asp:TextBox ID="txtSenderPhone" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSenderPhone"
                        ErrorMessage="Sender Phone is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSenderPhone"
                        ErrorMessage="Phone Invalid !" ValidationExpression="^0\d{9,10}$" ForeColor="Red">(*)</asp:RegularExpressionValidator><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Address:"></asp:Label>
                    <asp:TextBox ID="txtSenderAddress" runat="server" TextMode="MultiLine" Width="330px" Height="35px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSenderAddress"
                        ErrorMessage="Sender Address is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                    <br />
                </fieldset>
                <br />
                <fieldset id="Fieldset2" class="form" style="text-align: left">
                    <legend class="legend" style="width: 85px">RECEIVER INFORMATION</legend>&nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label9" runat="server" Text="Receiver Name:"></asp:Label>
                    <asp:TextBox ID="txtReceiverName" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtReceiverName"
                        ErrorMessage="Receiver Name is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label10" runat="server"
                    Text="Phone:"></asp:Label>
                    <asp:TextBox ID="txtReceiverPhone" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtReceiverPhone"
                        ErrorMessage="Receiver Phone is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtReceiverPhone"
                        ErrorMessage="Phone Invalid !" ValidationExpression="^0\d{9,10}$" ForeColor="Red">(*)</asp:RegularExpressionValidator><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label11" runat="server" Text="Address:"></asp:Label>
                    <asp:TextBox ID="txtReceiverAddress" runat="server" TextMode="MultiLine" Width="330px" Height="35px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtReceiverAddress"
                        ErrorMessage="Receiver Address is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                    <br />
                    <br />
                </fieldset>
                <fieldset id="Fieldset3" class="form" style="text-align: left; width: 680px;">
                    <legend class="legend" style="width: 85px">MAIL / &nbsp;DELIVERY / FEE </legend>
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label19" runat="server" Text="Service Type:"></asp:Label>
                    <asp:DropDownList ID="ddlService" runat="server" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlService_SelectedIndexChanged">
                    </asp:DropDownList><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label20" runat="server" Text="Distance: "></asp:Label>
                    <asp:DropDownList ID="ddlDistance" runat="server" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistance_SelectedIndexChanged">
                    </asp:DropDownList><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label21" runat="server" Text="Weight:"></asp:Label>&nbsp;<asp:DropDownList ID="ddlWeight" runat="server" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlWeight_SelectedIndexChanged">
                </asp:DropDownList>
                    &nbsp;<br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label22" runat="server" Text="Total: "></asp:Label>
                    &nbsp;<asp:TextBox ID="txtTotal" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label23" runat="server" Text="Note: "></asp:Label>
                    &nbsp;<asp:TextBox ID="txtNote" runat="server" Height="35px" TextMode="MultiLine" Width="330px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                    <br />
                </fieldset>
            </asp:Panel>
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="lblStatusAddNewOrder" runat="server" ForeColor="Red"></asp:Label>&nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Button ID="btnCreate" runat="server" Text="Create" Width="105px" OnClick="btnCreate_Click" />
            <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="False" PostBackUrl="~/Employee/HomeEmployee.aspx" /><br />
        </div>
    </div>
</asp:Content>
