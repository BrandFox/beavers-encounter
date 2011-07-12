<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%= Convert.ToString(Application["AppTitle"]) %></h2>
    <h3>��� ������?</h3>
    <%
    if (!((User) User).Identity.IsAuthenticated) 
    { %>
    <p>
        ��� ����� � ������� ��������� �� ������ <%= Html.ActionLink<AccountController>(c => c.LogOn(), "�����") %> � ������� ������ ���� ��������.
    </p>
    <p>
        ���� �� ��� �� �����������������, �� ����������������� ����� <%= Html.ActionLink<AccountController>(c => c.Register(), "�����������")%>.
    </p>
    <%
    }
    else if (((User)User).Role.IsAdministrator)
    { %>
    <p>
        <div>�� ������������� ������.</div>
        <div>�� ������ ���������:
            <ul>
                <li>�������� <%= Html.ActionLink<AdminAppConfigController>(c => c.Edit(), "���������")%> �����</li>
                <li>��������� <%= Html.ActionLink<AdminUsersController>(c => c.Index(), "��������������")%> (���������, �������� �������� � ������� �������������)</li>
                <li>��������� <%= Html.ActionLink<AdminGamesController>(c => c.Index(), "������� ���")%> (���������, �������� �������� � ������� ����)</li>
            </ul>
        </div>
    </p>
    <%
    } 
    else if (((User)User).Role.IsAuthor)
    { %>
    <p>
        <div>�� ����� ���� <%= Html.ActionLink<GamesController>(c => c.Edit(((User)User).Game.Id), ((User)User).Game.Name)%>.</div>
        <div>�� ������ ���������:
            <ul>
                <li>������������� �������� ����� ����</li>
                <li>��������� ���������� ���� (���������, ������������� � ��.)</li>
                <li>������������� ������ �������</li>
                <li>��������� �������</li>
                <li>�������������� ��������� ������� ��� ������� � ����</li>
            </ul>
        </div>
    </p>
    <%
    }
    else if (((User)User).Team == null)
    { %>
    <p>
        <div>�� ������ �������� � ������������ �������.</div>
        <div>���� �� ������� ������ �������, ���������� � �������, �� �� ������������� ������� �� ���������.</div>
        <div>��� ���������� � ������� ����� ���� �������. �������� ������� �������� ��� � ������ ����, ������ ����� �� ���� � ������� � ����� ����� �������� ��� ������� ����� �������, ����� ��� ����� ����� � ��� ������������������.</div>
        <div>���� ���� ���������� � ���, ��� ��� ������� ���� �������� ������� �����, ������� ���������� � ������� ���� � �������� �������� ��� �������.</div>
    </p>
    <%
    }
    else if (((User)User).Team != null && ((User)User).Role.IsTeamLeader)
    { %>
    <p>
        <div>�� ������� ������� <%= Html.ActionLink<TeamsController>(c => c.Show(((User)User).Team.Id), ((User)User).Team.Name)%>.</div>
        <div>��������, ���������������� �� ���� ������� �� ������� � ������������ ��� ����.</div>
        <div>�� ������ ��������� ������� ������� � ����� �������.</div>
        <div>�� ������ ������� ����������� ����������, � ���� ������ ��������� ������ �����, ������� � ������ ������� ����� �� ����.</div>
    </p>
    <%
    } 
    else if (((User)User).Team != null && ((User)User).Role.IsPlayer)
    { %>
    <p>
        <div>�� ����� ������� <%= Html.ActionLink<TeamsController>(c => c.Show(((User)User).Team.Id), ((User)User).Team.Name)%>.</div>
        <div>���� ���� ������� ���������������� �� ������� � �����-���� ����, �� �������� ������ ����.</div>
        <div>��� ������� �� ������ �������� �������, �� �� ���� ����� ��������� � ����������� ������ ��������. ��� ���������� ���������� � ������� ��� ����������� ��� �������.</div>
    </p>
    <%
    } %>
</asp:Content>
