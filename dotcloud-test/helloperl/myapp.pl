#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
#plugin 'pod_renderer';

get '/' => sub {
  my $self = shift;
  $self->render('index');
};

my $absolute_path = './static';
app->static->root($absolute_path);
app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
Welcome to Mojolicious:Lite!
on dotcloud!

^_^


@@ layouts/default.html.ep
<!doctype html><html>
  <head><title><%= title %></title>
  <LINK REL=StyleSheet HREF="style.css" TYPE="text/css">
  </head>
  <body>
  <div id="wrapper">
	<div id="wrapper2">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">Captive <span>Green</span></a></h1>
			</div>
			<div id="menu">
				<ul>
					<li class="current_page_item"><a href="#">Homepage</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">Photos</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
		</div>
		<div id="banner"></div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="#"> <%=content%> </a></h2>
					<p class="meta"><span class="date">December 26, 2011</span><span class="posted">Posted by <a href="#">Someone</a></span></p>
					<div style="clear: both;">&nbsp;</div>
					<div class="entry">

  
                        <%=content%>

						<p class="links"><a href="#" class="more">Read More</a><a href="#" title="b0x" class="comments">Comments</a></p>
					</div>
				</div>
				<div class="post">
					<h2 class="title"><a href="#">Lorem ipsum sed aliquam</a></h2>
					<p class="meta"><span class="date">December 24, 2011</span><span class="posted">Posted by <a href="#">Someone</a></span></p>
					<div style="clear: both;">&nbsp;</div>
					<div class="entry">
						<p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, elementum vel, tempor at, varius non, purus. Mauris vitae nisl nec metus placerat consectetuer. Donec ipsum. Proin imperdiet est. Phasellus <a href="#">dapibus semper urna</a>. Pellentesque ornare, orci in consectetuer hendrerit, urna elit eleifend nunc, ut consectetuer nisl felis ac diam. Etiam non felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.  Mauris quam enim, molestie in, rhoncus.</p>
						<p class="links"><a href="#" class="more">Read More</a><a href="#" title="b0x" class="comments">Comments</a></p>
					</div>
				</div>
				<div class="post">
					<h2 class="title"><a href="#">Consecteteur hendrerit </a></h2>
					<p class="meta"><span class="date">December 20, 2011</span><span class="posted">Posted by <a href="#">Someone</a></span></p>
					<div style="clear: both;">&nbsp;</div>
					<div class="entry">
						<p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, elementum vel, tempor at, varius non, purus. Mauris vitae nisl nec metus placerat consectetuer. Donec ipsum. Proin imperdiet est. Phasellus <a href="#">dapibus semper urna</a>. Pellentesque ornare, orci in consectetuer hendrerit, urna elit eleifend nunc, ut consectetuer nisl felis ac diam. Etiam non felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.  Mauris quam enim, molestie in, rhoncus.</p>
						<p class="links"><a href="#" class="more">Read More</a><a href="#" title="b0x" class="comments">Comments</a></p>
					</div>
				</div>
				<div style="clear: both;">&nbsp;</div>
			</div>
			<!-- end #content -->
			<div id="sidebar">
				<ul>
					<li>
						<div id="search" >
							<form method="get" action="#">
								<div>
									<input type="text" name="s" id="search-text" value="" />
									<input type="submit" id="search-submit" value="GO" />
								</div>
							</form>
						</div>
						<div style="clear: both;">&nbsp;</div>
					</li>
					<li>
						<h2>Aliquam tempus</h2>
						<p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper consectetuer hendrerit.</p>
					</li>
					<li>
						<h2>Categories</h2>
						<ul>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
						</ul>
					</li>
					<li>
						<h2>Blogroll</h2>
						<ul>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
						</ul>
					</li>
					<li>
						<h2>Archives</h2>
						<ul>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
		<div id="footer">
			<p>Copyright (c) 2011 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
		</div>
	</div>
</div>
<!-- end #footer -->
  </body>
</html>
