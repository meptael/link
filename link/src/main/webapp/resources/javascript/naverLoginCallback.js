
		  	function naverSignInCallback() {

			var naver_id_login = new naver_id_login("Ml9RKhaCexgFbiAJLp0c", "http://192.168.0.183:8080/user/loginView.jsp");
		  	var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("green", 3, 50);
		  	naver_id_login.setDomain("http://192.168.0.183:8080/");
		  	naver_id_login.setState(state);
		  	naver_id_login.init_naver_id_login();
		  	console.log(naver_id_login);
	  		
		  	naver_id_login.get_naver_userprofile("naverSignInCallback()");

		  	   console.log(naver_id_login.getProfileData('email'))
		  	   console.log(naver_id_login.getProfileData('name'))
		  	   console.log(naver_id_login.getProfileData('gender'))
//		  	   $("form").attr("method","POST").attr("action","/user/snsLogin").submit();
		  	  }