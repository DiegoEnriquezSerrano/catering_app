<script>

</script>

<main>
  <div class="authentication-form">
    <a href="/signup/caterer">Want to register as a Caterer?</a>

    <div class="field">
      <label for="username">Username</label>
      <input type="text" name="username" placeholder="Enter a username">
    </div>
    <div class="field">
      <label for="email">Email</label>
      <input type="text" name="email" placeholder="Enter your email address">
    </div>
    <div class="field">
      <label for="password">Password</label>
      <input type="password" name="password" placeholder="Create a password">
    </div>
  </div>
</main>

<style>

main {
  display: grid;
  width: 100vw;
  align-content: center;
  justify-content: center;
  align-items: center;
  justify-items: center;
}

.authentication-form {
  display: grid;
  background-color: #E09F3E;
  color: #FFFFFF;
  grid-template-rows: 75px 75px 75px;
  align-content: center;
  align-items: center;
  justify-items: center;
  justify-content: center;
  border-radius: 5px;
}

.field {
  display: grid;
  grid-template-columns: 150px 1fr;
}

label {
  font-size: 1.1rem;
  font-weight: bold;
}

</style>