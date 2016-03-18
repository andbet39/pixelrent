

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="empty" />

    <title>Rent a Pixel</title>

</head>

<body>


<div class="container">

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
                        Status
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
                            <img height="25px" src="${space.img_url}">
                        </td>
                        <td>
                                <g:if test="${space.paid == false}">
                            <g:form action="charge" method="POST">
                                <input type="hidden" value="${space.id}" name="id">
                                <script
                                        src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                        data-key="pk_test_p0QQDCeJQA7W9X9y0VP7QOz5"
                                        data-amount="${space.size_x * space.size_y}"
                                        data-name="Demo Site"
                                        data-description="${space.size_x *space.size_y}Sq/Px for ($${space.size_x *space.size_y/100})"
                                        data-image="/128x128.png"
                                        data-locale="auto">
                                </script>
                            </g:form>
                                </g:if>

                        </td>
                    </tr>
                </g:each>
            </table>

        </div>

    </div>
</div>


</body>
</html>