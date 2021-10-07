$(function () {
  let forgotQuestion = $(".auth-q-forgot");
  registerQuestion = $(".auth-q-register");
  forgotContainer = $(".password-reset-container");
  registerContainer = $(".register-container");
  loginContainer = $(".login-container");

  $(forgotQuestion).click(function () {
    $(loginContainer).addClass("hide");
    $(forgotContainer).addClass("show");
    console.log("Its working");
  });

  $(registerQuestion).click(function () {
    $(loginContainer).addClass("hide");
    $(registerContainer).addClass("show");
    console.log("Its working 2");
  });
});
