

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="ninestar" />

    <title>Rent a Pixel</title>

</head>

<body>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 style="display: inline-block" class="form-title">My space</h3>
                    <g:link style="float: right;" action="newspace" controller="cusSpace"><button class="btn btn-success">New Space</button></g:link>

                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <table id="table-checks" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td>
                                        Link
                                    </td>
                                    <td>
                                        Size
                                    </td>
                                    <td>
                                        Img
                                    </td>
                                    <td>
                                        Expiration date
                                    </td><td>
                                    Action
                                </td>
                                </tr>
                                </thead>
                                <g:each var="space" in="${spaceList}">
                                    <tr>
                                        <td>
                                            ${space.ad_link}
                                        </td>
                                        <td>
                                            ${space.size_x *space.size_y } Sq./Px
                                        </td>
                                        <td>
                                            <img height="25px" src="${createLink(controller:'cusSpace', action:'showPayload', id:"${space.id}")}">

                                        </td>
                                        <td>

                                            <g:formatDate format="dd-MM-yyyy" date="${space.expire_date}"/>

                                        </td>
                                        <td>
                                            <g:link action="renew" id="${space.id}">Renew 30 days</g:link>

                                        </td>
                                    </tr>
                                </g:each>
                            </table>

                        </div>
                </div>
            </div>
        </div>
    </div>


    </div>
</div>


</body>
</html>