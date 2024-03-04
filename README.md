# Tests réalisés sur la carte

## Tests éléctronique
Nous avons testé au multimètre si les différents ground et 3,3V étaient reliés entre eux. Nous avons réalisés le même tests sur les différents pins du circuit.
Pour vérifier la qulité de notre soudure, nous avons vérifié qu'il n'y ai aucun court circuit et les valeurs des différents composants (résistances et capacités).
En regardant au microscope et en testant, on a remarqué quelques courts-circuits quue nous avons immédiatement resoudé.

Nous avons cependant fait un grave erreur dès le schematic de notre carte : nous avons connecté les ports SWCLK et SWDIO sur les mauvais ports, ce qui empêchait le bon fonctionnement de la carte... Nous avons dû improvisé en créant des pistes volantes pour bien les connecter.

<div style="text-align:center;">
  <img src="Image_PCB_Changement.png.jpg" alt="PCB apèrs correction" width="480" height="270">
</div>


## Tests informatiques

A l'aide de la documentation fournis sur le site : https://linuxembedded.fr/2021/02/bare-metal-from-zero-to-blink, nous avons réaliser un Startup file nommé stm32_startup.c permettant de bien définir l'environnement pour le code main().
Il permet entre autre de gérer les handler du stm32f030f4 et d'attribuer les bonnes fonctions aux handler.

Nous avons ensuite créer le Linker cript nommé stm32_ls.ld qui permet de déterminer les adresses absolues des différentes sections en faisant référence aux informations mentionnées dans le Linker script.

Nous avons ensuite effectuer les modification necessaire pour permettre l'utilisation d'OpenOCD avec la carte : https://www.radioshuttle.de/en/turtle-en/nucleo-st-link-interface-en/

