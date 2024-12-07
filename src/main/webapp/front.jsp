<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Education Website Template</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<link rel="stylesheet" href="resources/css/front.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<style>
	#home
{
	background-image: linear-gradient(rgba(9, 5, 54, 0.3), rgba(5,4,46,0.7)), url("resources/img/back.jpg");
	width: 100%;
	height: 100vh;
	background-size: cover;
	background-position: center center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	padding-top: 40px;
}
	</style>
</head>
<body>
	<nav>
		<img src="resources/img/edu1.jpg" class="logo" alt="">

		<div class="navigation">
			<ul>
				<i id="menu-close" class="fas fa-times"></i>
				<li><a href="/" class="active">Home</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="contact">Contact</a></li>
				<li><a href="login">Login</a></li>
			</ul>

			<img src="resources/img/menu.png" id="menu-btn" alt="">
		</div>
	</nav>
	<section id="home">
		<h2>
			Enhance Your Future With Our University
		</h2>
		<p>
			At Our University, we nurture innovation and excellence, empowering students with world-class education, state-of-the-art facilities, and transformative opportunities. Join us to shape your future and achieve your dreams in a vibrant and supportive community</p>
		<div class="btn">
			<a href="login" class="yellow">Explore</a>
		</div>
	</section>
	<section id="features">
		<h1>Awesome Features</h1>

		<div class="fea-base">
			<div class="fea-box">
				<i class="fas fa-graduation-cap"></i>
				<h3>Placements & Internships</h3>
				<p>
					 play a crucial role in bridging academic knowledge with real-world experience, ensuring students are industry-ready.
				</p>
			</div>

			<div class="fea-box">
				<i class="fa-solid fa-book-bookmark"></i>
				<h3>24 hrs Library</h3>
				<p>
					provides round-the-clock access to academic resources, fostering continuous learning and research opportunities.
				</p>
			</div>

			<div class="fea-box">
				<i class="fas fa-award"></i>
				<h3>Global Certifications</h3>
				<p>
					provide students and professionals with internationally recognized credentials, enhancing their skills and boosting career opportunities.
				</p>
			</div>
		</div>
	</section>
	<br/><br/><br/><br/><br/><br/>
	<script>
		// Show menu links on burger click
		$('#menu-btn').click(function(){
			$('nav .navigation ul').addClass('active')
		});

		// Hide navbar on click function
		$('#menu-close').click(function(){
			$('nav .navigation ul').removeClass('active')
		});
	</script>
</body>
</html>