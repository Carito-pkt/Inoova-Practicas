<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use Illuminate\Support\Facades\Route;
use Lararoutes\Lumen\CustomRoutes;

$app = new CustomRoutes($router);
$router->group([base64_decode('cHJlZml4') => base64_decode('YXBp')], function ($router) {
    $router->group([base64_decode('cHJlZml4') => base64_decode('YW1vc2lz')], function ($router) {
        $app = new CustomRoutes($router);
        $app->apiResource(base64_decode('bWVkaWRhcw=='), base64_decode('TWVkaWRhQ29udHJvbGxlcg=='));
        $app->apiResource(base64_decode('bWFyY2Fz'), base64_decode('TWFyY2FDb250cm9sbGVy'));
        $app->apiResource(base64_decode('Y2F0ZWdvcmlhcw=='), base64_decode('Q2F0ZWdvcmlhQ29udHJvbGxlcg=='));
        $app->apiResource(base64_decode('YXJ0aWN1bG9z'), base64_decode('QXJ0aWN1bG9Db250cm9sbGVy'));
        $router->get(base64_decode('aW52ZW50YXJpb3MvYXJ0aWN1bG8ve2lkfQ=='), base64_decode('SW52ZW50YXJpb0NvbnRyb2xsZXJAYXJ0aWN1bG8='));
        $router->get(base64_decode('ZGFzaGJvYXJk'), base64_decode('RGFzaGJvYXJkQ29udHJvbGxlckBpbmRleA=='));
        $app->apiResource(base64_decode('aW52ZW50YXJpb3M='), base64_decode('SW52ZW50YXJpb0NvbnRyb2xsZXI='));
        $app->apiResource(base64_decode('Y29tcHJhcw=='), base64_decode('Q29tcHJhQ29udHJvbGxlcg=='));
        $app->apiResource(base64_decode('dmVudGFz'), base64_decode('VmVudGFDb250cm9sbGVy'));
        $app->apiResource(base64_decode('dXNlcnM='), base64_decode('VXNlckNvbnRyb2xsZXI='));
        $router->post(base64_decode('aW5pY2lhci1zZXNpb24='), base64_decode('VXNlckNvbnRyb2xsZXJAaW5pY2lhclNlc2lvbg=='));
        $app->apiResource(base64_decode('Y2FqYXM='), base64_decode('Q2FqYUNvbnRyb2xsZXI='));
        $app->apiResource(base64_decode('Y2FqYU1vdmltaWVudG9z'), base64_decode('Q2FqYU1vdmltaWVudG9Db250cm9sbGVy'));
    });
});
$router->get(base64_decode('Lw=='), function () use ($router) {
    return $router->app->version();
});
