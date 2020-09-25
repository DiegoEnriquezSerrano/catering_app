<script>

import { createEventDispatcher } from 'svelte'; 

console.log(window.location);

let dispatch = createEventDispatcher();

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
        dispatch('loadPage', { page: obj.page, params: obj.params });
      }
    });
};

</script>

<main>
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
</main>

<style>

main {
  width: 100vw;
  height: 100%;
  min-height: 100vh;
  background-image: url('/images/HomePageSplash.jpg');
  background-position: top left;
  margin: 0;
  display: block;
  background-size: cover;
  background-repeat: no-repeat;
  color: #fdfdfd;
  border-bottom-left-radius: 40%;
  border-bottom-right-radius: 40%;
}

nav {
  display: grid;
  color: #ffffff;
  grid-template-columns: 150px 1fr;
  align-items: center;
  justify-items: stretch;
  text-shadow: 0 0 10px rgb(0,0,0);
  font-size: 1.2rem;
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

a {
  text-transform: none;
  text-decoration: none;
  color: #ffffff
}
</style>