<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="About Us.aspx.cs" Inherits="OPMS_Website.About_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="Branches.aspx">Branch</a></li>
        <li><a href="Support.aspx">Support</a></li>
        <li id="current"><a href="About Us.aspx">About Us</a></li>
        <li>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Login.aspx">Login</asp:LinkButton></li>
        <li></li>
    </ul>
    &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <a name="TemplateInfo">
        <h1>About Us</h1>
    </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <span id="result_box" class="long_text"><span title="Công ty UPS vẫn tiếp tục duy trì được sự dẫn đầu của mình trong lĩnh vực bưu chính đối với các gói bưu kiện nhỏ mặc dù có sự cạnh tranh khốc liệt của FedEx, AirBone Express."></span><span title="Hàng năm, công ty UPS đầu tư hơn 1 tỷ $ để duy trì được chất lượng phục vụ khách hàng ở mức cao trong khi keeping costs low and streamlining its overall operations.">
        <span style="font-size: 11pt"><span style="color: #000000">&nbsp;<asp:Image ID="Image1"
            runat="server" ImageUrl="~/CSS/images/bird.jpeg" ToolTip="Images" />&nbsp; </span><span
                style="font-size: 10pt"><span style="color: #000000">TARS Delivery System is a postal
                organization with different branches at different cities delivering the mails through
                various options like courier, speed post, </span>
                <?xml namespace="" ns="urn:schemas-microsoft-com:office:smarttags" prefix="st1" ?>
                <st1:place w:st="on"><SPAN style="COLOR: #000000">Normal</SPAN></st1:place>
            </span></span><span style="font-size: 10pt; color: #000000">post, VPP etc… and money
            orders.&nbsp;<br />
                <br />
                &nbsp;&nbsp; With the motto customer is number one, we've built a website system
            allows the sender can find information about mailing services, the fees for services.
            In addition customers can check the status of the mail package (Deliverables) is
            based on PIN code that we provide when sending mail</span></span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <span style="font-size: 11pt">
        <br />
        <br />
        &nbsp;&nbsp; <span style="font-size: 10pt">TARS company continues to maintain a lead
            in their postal package for small parcels, although there is fierce competition
            for FedEx, AirBone Express. <span title="Công ty duy trì được sự dẫn đầu đó là nhờ đầu tư rất mạnh vào các công nghệ thông tin tiên tiến.">Company maintained a lead through the very strong investment in advanced information
                technology. </span><span title="Hàng năm, công ty UPS đầu tư hơn 1 tỷ $ để duy trì được chất lượng phục vụ khách hàng ở mức cao trong khi keeping costs low and streamlining its overall operations.">Each year, UPS company invested more than $ 1 billion to maintain the quality of
                    customer service at a high level while keeping costs low and streamlining its overall
                    operations.<br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </span></span></span>
</asp:Content>
