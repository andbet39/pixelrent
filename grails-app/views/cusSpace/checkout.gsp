<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="ninestar"/>
    <title>Checkout</title>
</head>

<body>

<div class="container">
    <div class="page-wrap">


    <div class="row">
        <div class="col-md-6 col-sm-12 col-md-offset-3 form-panel">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="form-title">Check-out order</h3>
                </div>

                <div class="panel-body">
                    <div>
                        <img class="center-block" height="${order.space.size_y}"
                             src="${createLink(controller: 'cusSpace', action: 'showPayload', id: "${order.space.id}")}">
                    </div>


                    <div class="img-info">
                        <span style="float: right"><strong>AREA</strong> ${order.space.size_x * order.space.size_y} Sq.Pixel
                        </span>
                        <span><strong>Price</strong> ${order.amount / 100} $</span>

                    </div>

                    <div class="ord-info">

                        <span><strong>Expire date</strong> <g:formatDate format="dd-MM-yyyy" date="${newExpireDate}"/>
                            </span>
                    </div>

                    <div class="ord-info">

                        <span><strong>Size</strong> ${order.space.size_x} x ${order.space.size_y}</span>
                    </div>

                    <div class="ord-info">

                        <span><strong>Image Link</strong> ${order.space.ad_link}</span>
                    </div>


                    <div class="ord-info" style="display: inline-block;float: right">
                        <g:form controller="pixelRent" action="charge" method="POST">
                            <div class="control-group">
                                <div class="controls">
                                    <input type="hidden" value="${order.id}" name="id">
                                    <script
                                            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                            data-key="pk_test_p0QQDCeJQA7W9X9y0VP7QOz5"
                                            data-amount="${order.amount}"
                                            data-name="Pixel Rent"
                                            data-description="${order.space.size_x * order.space.size_y}Sq/Px for ($${order.space.size_x * order.space.size_y / 100})"
                                            data-image="${createLink(controller: 'cusSpace', action: 'showPayload', id: "${order.space.id}")}"
                                            data-locale="auto">
                                    </script>
                                </div>

                            </div>

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
</body>
</html>
