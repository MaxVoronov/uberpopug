<?php declare(strict_types=1);

namespace App\Base\Application\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class HomeController extends AbstractController
{
    public function __invoke(): Response
    {
        $homePage = $this->generateUrl('home', [], UrlGeneratorInterface::ABSOLUTE_URL);

        return $this->render('home.html.twig', [
            'homePage' => $homePage,
        ]);
    }
}
