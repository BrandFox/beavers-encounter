<%@ Page Title="Create User" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
	Inherits="System.Web.Mvc.ViewPage<Beavers.Encounter.Web.Controllers.UsersController.UserFormViewModel>" %>

<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

	<h1>Create User</h1>

	<% Html.RenderPartial("UserForm", ViewData); %>

</asp:Content>