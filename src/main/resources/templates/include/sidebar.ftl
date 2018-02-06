<!-----------------------------------------------------------------+
   "#sidebar_left" Helper Classes:
-------------------------------------------------------------------+
   * Positioning Classes:
    '.affix' - Sets Sidebar Left to the fixed position

   * Available Skin Classes:
     .sidebar-dark (default no class needed)
     .sidebar-light
     .sidebar-light.light
-------------------------------------------------------------------+
   Example: <aside id="sidebar_left" class="affix sidebar-light">
   Results: Fixed Left Sidebar with light/white background
------------------------------------------------------------------->

<!-- Start: Sidebar -->
<aside id="sidebar_left" class="nano nano-primary affix has-scrollbar sidebar-default">

    <!-- Start: Sidebar Left Content -->
    <div class="sidebar-left-content nano-content">
        <!-- Start: Sidebar Menu -->
        <ul id="menuBar" class="nav sidebar-menu">

        </ul>
        <!-- End: Sidebar Menu -->

        <!-- Start: Sidebar Collapse Button -->
        <div class="sidebar-toggle-mini">
            <a href="#">
                <span class="fa fa-sign-out"></span>
            </a>
        </div>
        <!-- End: Sidebar Collapse Button -->

    </div>
    <!-- End: Sidebar Left Content -->

</aside>
<!-- End: Sidebar Left -->