<?php
/**
 * Front to the WordPress application. This file doesn't do anything, but loads
 * wp-blog-header.php which does and tells WordPress to load the theme.
 *
 * @package WordPress
 */

/**
 * Tells WordPress to load the WordPress theme and output it.
 *
 * @var bool
 */
define( 'WP_USE_THEMES', true );

/** Loads the WordPress Environment and Template */
require __DIR__ . '/wp-blog-header.php';

// Aquí comienza el loop de WordPress
if (have_posts()) {
    while (have_posts()) {
        the_post();
        ?>
        <!-- Aquí empieza el contenido HTML -->
        <div class="contenido-html">
            <h2>Titulo HTML</h2>
            <p>Este es un párrafo HTML.</p>
            <!-- Puedes agregar más contenido HTML aquí -->
        </div>
        <!-- Aquí termina el contenido HTML -->
        <?php
    }
}
?>

