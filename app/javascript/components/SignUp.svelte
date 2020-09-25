<script>

  import { onMount } from 'svelte';

  onMount(() => {
    console.log('SignUP!');
  })

  async function sectionClick(e) {
  await fetch(e.target.pathname, { method: 'GET', headers: { "Content-Type": "application/json" } })
    .then(response => {
      response = { status: response.status, response: response }
      return response;
    })
    .then(async data => {
      let res = await data.response.text();
      let obj = JSON.parse(res);
      if (obj.status === "ok") {
        dispatch('loadPage', obj.page);
      }
    });
};

</script>

<nav>
  <div class="brand">
    <a href="/home" on:click|preventDefault={sectionClick}>Feedr</a>
  </div>
  <ul>
    <li><a href="/signup" on:click|preventDefault={sectionClick}>Sign Up</a></li>
    <li><a href="/login" on:click|preventDefault={sectionClick}>Login</a></li>
    <li>Search</li>
  </ul>
</nav>
  
<main>
  <div class="authentication-form">
    <a href="/signup/caterer" class="primary">Want to register as a Caterer?</a>
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

.authentication-form {
  display: grid;
  background-color: #ffffff;
  color: #020202;
  grid-template-rows: 75px 75px 75px 75px;
  align-content: center;
  align-items: center;
  justify-items: center;
  justify-content: center;
  max-width: 600px;
  width: calc(100% - 20px);
  border: 4px solid #A1A1A1;
  margin-top: 20px;
}

.field {
  display: grid;
  grid-template-columns: 150px 1fr;
}

label {
  font-size: 1.1rem;
  font-weight: bold;
}

main {
  width: 100vw;
  height: 100%;
  min-height: 100vh;
  background-position: top left;
  margin: 0;
  display: grid;
  background-size: cover;
  background-repeat: no-repeat;
  color: #fdfdfd;
  align-items: center;
  justify-items: center;
  position: absolute;
  top: 0;
}

nav {
  display: grid;
  color: #ffffff;
  background-color: #e09f3e;
  grid-template-columns: 150px 1fr;
  align-items: center;
  justify-items: stretch;
  text-shadow: 0 0 10px rgb(0,0,0);
  font-size: 1.2rem;
  box-shadow: 0 1px 3px -1px rgb(25,25,25);
  z-index: 100;
  position: fixed;
  top: 0;
  width: 100vw;
}

.brand {
  padding: 15px;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
  text-align: right;
}

li {
  display: inline-block;
  padding: 15px;
  margin: 0;
}

nav a {
  text-transform: none;
  text-decoration: none;
  color: #ffffff
}

.primary {
  color: #e09f3e;
  font-weight: bold;
  text-decoration: none;
}

</style>