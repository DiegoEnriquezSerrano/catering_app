<script>

import { onMount } from 'svelte';
import { createEventDispatcher } from 'svelte';

export let params;

$: params;

onMount(() => {
  console.log('SignUP!');
})

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
    {#if params == ''}
      <p>
        <a href="/signup/caterer" class="primary" on:click|preventDefault={sectionClick}>Click here to register as a Caterer</a>
      </p>
    {/if}
    <div class="fields_pair">
      <div class="field sm">
        <label for="first_name">First name</label>
        <input type="text" name="first_name">
      </div>
      <div class="field sm">
        <label for="last_name">Last name</label>
        <input type="text" name="last_name">
      </div>
    </div>
    <div class="field">
      <label for="email">Email</label>
      <input type="text" name="email">
    </div>
    <div class="field">
      <label for="password">Password</label>
      <input type="password" name="password">
    </div>
    {#if params == 'caterer'}
      <div class="field">
        <label for="business_name">Business name</label>
        <input type="text" name="business_name">
      </div>
      <div class="field">
        <label for="address">Business address</label>
        <input type="text" name="address">
      </div>
      <div class="fields_trio">
        <div class="field xsm">
          <label for="city">City</label>
          <input type="text" name="city">
        </div>
        <div class="field xsm">
          <label for="state">State</label>
          <input type="text" name="state">
        </div>
        <div class="field xsm">
          <label for="zip">Zip Code</label>
          <input type="text" name="zip">
        </div>
      </div>
    {/if}
    <button type="submit" class="button primary">Submit</button>
  </div>
</main>

<style>

main {
  background-image: url('/images/SignUpPageBackground.jpg');
  background-attachment: fixed;
  background-position: top center;
}

.authentication-form {
  display: grid;
  background-color: #ffffff;
  color: #020202;
  align-content: center;
  align-items: center;
  justify-content: stretch;
  max-width: 500px;
  width: calc(100vw - 20px);
  border: 2px solid #B6B6B6;
  margin-top: 20px;
  border-radius: 5px;
  box-shadow: 0 1px 5px -2px rgb(10,10,10);
  padding: 20px;
}

.field {
  display: grid;
  grid-template-columns: 1fr;
  grid-auto-flow: row;
  grid-gap: 5px;
}

.fields_pair {
  display: grid;
  grid-auto-flow: column;
  grid-template-columns: 1fr 1fr;
  width: 100%;
  grid-gap: 10px;
}

.fields_trio {
  display: grid;
  grid-auto-flow: column;
  grid-template-columns: 1fr 1fr 1fr;
  width: 100%;
  grid-gap: 10px;
}

label {
  font-size: 1.0rem;
  font-weight: bold;
  font-family: Arial, Helvetica, sans-serif;
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
  background-image: linear-gradient(to top, rgb(224, 159, 62), rgba(224,190,140,0.6));
  grid-template-columns: 150px 1fr;
  align-items: center;
  justify-items: stretch;
  text-shadow: 0 0 5px rgb(0,0,0);
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

.button.primary {
  color: #ffffff;
  background-color: #e09f3e;
  padding: 10px;
  border-radius: 5px;
  border-width: 0;
}

.button.primary:hover {
  background-color: #fff3b0;
}

input {
  padding: 5px;
}

</style>