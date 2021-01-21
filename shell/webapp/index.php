<!DOCTYPE html>
<html>
<head>
	<title>Mama Laundry</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css">		
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,400;0,500;1,500&display=swap">
	<link rel="stylesheet" type="text/css" href="css/main-stylesheet.php" media="screen" />
	<link rel="icon" href="image/mama-laundry.ico">
	<script type="text/javascript" src="js/smartsupp-livechat.js"></script>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>		
</head>
<body>
	<div class="nav-topbar">
		<ul>
			<li><a class="nav-item" href="#"><i class="fas fa-search"></i></a></li>						
			<li><a class="nav-item" href="#"><i class="fas fa-book"></i></a></li>
			<li><a class="nav-item" href="#"><i class="fas fa-chart-pie"></i></a></li>			
			<li><a class="nav-item" href="#"><i class="fas fa-code"></i></a></li>
			<li><a class="nav-item" href="#"><i class="fas fa-copyright"></i></a></li>
			<li class="open-btn"><a class="nav-item"><i class="fas fa-bug"></i></a></li>			
		</ul>
	</div>		
	<div class="head-logo"><img src="image/logo-main.png"></a></div>	
	<div class="nav-sidebar">
		<ul>
			<li><a class="nav-item" href="#"><i class="fas fa-search"></i></i></a></li>						
			<li><a class="nav-item" href="#"><i class="fas fa-book"></i></a></li>
			<li><a class="nav-item" href="#"><i class="fas fa-chart-pie"></i></a></li>						
			<li><a class="nav-item" href="#"><i class="fas fa-code"></i></a></li>
			<li><a class="nav-item" href="#"><i class="fas fa-copyright"></i></a></li>
			<li class="open-btn"><a class="nav-item"><i class="fas fa-bug"></i></a></li>			
		</ul>
	</div>
	<div class="main-content">
		<p>
			When dealing with projects that are collaboratives, it's ideal to somehow posted it on public so other collegues can
			deploy and customize their wholesome projects. Or even just a personal projects, that wanted to share to public and giving
			other people thoughts and try to make it an open-source project to others. Well, git is one of the best tool to medium
			that desire. <br><br>

			<strong id="bold-phrase">Git</strong> 
			is a free and open source distributed version control system
			designed to handle everything from small to very large projects
			speed and efficiency. Git is easy to learn and has a tiny footprint with lightning fast performance. It outclasses SCM tools like Subversion, CVS, Perforce, and ClearCase with features like cheap local branching, convenient staging areas, and multiple workflows. By connecting git with github, people can share and post their projects on public and monitor their
			project's growth through time to time that can be done by many collaborators at a time.<br><br> 

			Using git can be done in Unix/Linux OS in terminal, or even in Windows OS in Powershell or CMD. Here, are a simple guide to
			work with Git and Github withsome essentials commands that are helpful to started with :
		</p>
		<ul>
			<li>Install Git & Crate GitHub Account
				<div>
					Here, you can follow this <a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git">instruction</a> on how to download Git in different OS that are available. Get your free <a href="https://github.com/">GitHub Account</a> also in order to create remote repository for the first time. You can also verify your git installation by checking the version of it. In my case, it's run on Windows. And all of the following snippets will be shown as in Windows. Unix/Linux should be the same thing :<br>
					<p class="snippet-code">
						$ git --version<br>
						<em>git version 2.27.0.windows.1</em>				
					</p>
				</div>
				<br>
			</li>		
			<li>Create Local Git Repository
				<div>
					Here, we are going to learn how to use git on terminal. If you haven't much experience with it, this <a href="https://www.hostinger.com/tutorials/linux-commands">article</a> cover most of the commands that we will be using. These following commands
					are also applicable for both Unix/Linux and Windows. To begin, open the terminal or CMD, and start to create a local	on your computer. In this case, its will be done in file Documents : <br>
					<p class="snippet-code">
						$ cd /home/cookie/Documents/ &nbsp&nbsp&nbsp<em>#changing directory in Linux</em><br> 
						$ cd C:\Users\cookie\Documents\ <em>#changing directory in Windows</em><br>		
						$ mkdir First_Repos &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<em>#create a folder called First_Repos</em><br>
						$ cd First_Repos<br>
						$ git init<br>
						<em>Initialized empty Git repository in C:/Users/cookie/Documents/First_Repos/.git/</em>					
					</p>
				</div>
				<br>
			</li>
			<li>Add a New File to the Local Repository
				<div>
					Now we can add a file that we wanted to publish on GitHub. For this purpose, the name of the file is <em id="name-file">index.html</em>. First locate the file to this directory, First_Repos. And make sure the terminal / CMD are still in First_Repos as the current working directory. Then, we can verify the status of our new repository by doing this following command :
					<p class="snippet-code">
						$ git status <br> 				
						<em>On branch master</em><br>
						<em>No commits yet</em><br>
						<em>Untracked files:</em><br>
						<em>&nbsp&nbsp(use "git add &#60file&#62..." to include in what will be commiteted)</em><br>
						<em>&nbsp&nbsp&nbsp&nbsp <em id="name-file2">index.html</em></em><br>
						<em>nothing added to commit but untracked files present (use "git add" to track)</em><br><br>
					</p>
				</div>
				<div>
					In ordter to commit / make changes to the file on the repository, the file have to be added to the staging environment first, in order
					to tell which files that want to be committed to the repository. By using "." in <em id="name-file">git add</em>, it will tells that all the files in this directory needed to be add to the staging environtment :
					<p class="snippet-code">
						$ git add .<br> 			
						$ git status<br>
						<em>On branch master</em><br>
						<em>No commits yet</em><br>
						<em>Changes to be commited:</em><br>
						<em>&nbsp&nbsp(use "git rm --cached &#60file&#62..." to unstage)</em><br>					
						<em>&nbsp&nbsp&nbsp&nbsp<em id="name-file">new file: &nbspindex.html</em></em><br>					
					</p>
				</div>
				<br>
			<li>Commit the File to Make Changes on the Local Repository</li>
				<div>
					Now, we can finally commit the files that have been added to the staging environment. This will changes the old files the the current one, or just simply added new files that are desired to our local repository, First_Repos. One thing to remember that all this changes haven't
					met to GitHub yet, therefore we need to confirm this changes first by committing the file :
					<p class="snippet-code">
						$ git commit -m "My First Commit. Version 1.0.0"<br> 		
						<em>[master (root-commit) f01a90c] My First Commit. Version 1.0.0</em><br>
						<em>1 file changed, 0 insertions(+), 0 deletions(-)</em><br>
						<em>create mode 100644 index.html</em><br>
					</p>				
					<p class="snippet-code">
						$ git status"<br> 						
						<em>On branch master</em><br>					
						<em>nothing to commit, working tree clean</em>
					</p>
				</div>
				<br>
			<li>Push the Local Repository to Remote Repository on GitHub</li>
				<div>
					Now you have successfully update your local repository, yeey !!. But it's still in our local machine, not in GitHub repository yet. What's the fun of that, right. By adding your projects on GitHub, you can do tons of stuff, such as doing an open-source projects, publish your projects on the internet but still in your private mode (requires premium account), or simply hosting a static website on GitHub Pages.<br><br> 

					Before upload your local repository to GitHub, First, you need to create a repository first on GitHub that later on will contain your local repository there. You can follow this <a href="https://help.github.com/en/enterprise/2.13/user/articles/creating-a-new-repository">instruction</a> that provided from GitHub itself. After that, we can copy the "Clone with HTTPS" section that are provided on GitHub, to specify which repository will be held for our local one for the first time :
					<p class="snippet-code">
						$ git remote add origin https://github.com/MNurIrsyad/github_repos.git"<br> 						
						$ git push -u -f origin master<br>
						<em>Enumerating objects: 3, done.</em><br>
						<em>Counting objects: 100% (3/3), done.</em><br>
						<em>Writing objects: 100% (3/3), 229 bytes | 114.00 KiB/s, done.</em><br>					
						<em>Total 3 (delta 0), reused 0 (delta 0), pack-reused 0</em><br>
						<em>To https://github.com/MNurIrsyad/test.git</em><br>
						<em>&nbsp+ bbdc547...f01a90c master -> master (forced update)</em><br>
						<em>Branch 'master' set up to track remote branch 'master' from 'origin'.Total 3 </em><br>					
					</p>				
					<br>
				</div>
				<div>
					Now you have successfully push your local repository to your remote repository on GitHub !!. Once you make changes again, or just simply add new file to the remote repository, make sure you repeat some of the steps that are required for you to update both local and remote repository. Here are the path to push your current repository after successfully push your repository for the first time :<br>
					<p class="snippet-code">
						$ cd /home/cookie/Documents/First_Repos<br>					
						$ git add .<br> 								
						$ git commit -m "My Update Commits. Version 2.0.0"<br> 								
						$ git push<br> 													
					</p>
				</div>
		</ul>	
		<p>
			<strong id="bold-phrase">Congratulations !!</strong>, you have successfully learn a very basic on upload and creating your first repository on GitHub. It feel good right ?. Make sure it motivates you to commit more and push more of your cool projects. Let me know what's your thoughts or suggestions in the comment section below. Cheers :D
			<br><br>
			References : <a href="https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners">HubSpot</a> , <a href="https://scotch.io/tutorials/how-to-push-an-existing-project-to-github">Scotch</a> , <a href="https://rogerdudler.github.io/git-guide/">rogerdudler.github.io</a>
		</p>		
	</div>	
	<div class="foot-logo">
		<footer>
			copyright © 2020 Mama Laundry, Inc. or it's affiliates. All rights reserved.<br>
			<a href="#">help</a> | 
			<a href="#">feedback</a> | 
			<a href="#">terms of use</a> | 
			<a href="#">privacy</a> | 			 
			<a href="https://github.com/hotpotcookie/">github</a>
		</footer>
	</div>	
</body>
</html>


<!-- input form bisab buat auto download -->
<?php 
/*
	$ip = shell_exec("cd bash/ && ./run_init.sh ip");
	$sm = shell_exec("cd bash/ && ./run_init.sh sm");					
	echo "$ip | $sm";
	echo "<br>-------------------------------";
*/
?>

