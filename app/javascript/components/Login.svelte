<script>

import { onMount } from 'svelte';
import { createEventDispatcher } from 'svelte';

let dispatch = createEventDispatcher();

let email;
let password;
let body;

let authorize = (e) => {
  body = {
    email: email.value,
    password: password.value,
  }
  console.log('click');

  let url = "/login";
  let reqParams = {
    method: 'POST',
    body: JSON.stringify(body),
    headers: { "Content-Type": "application/json" }
  };
  fetch(url, reqParams)
  .then(response => {
    if (response.status == 201) { return response.text() }
    else return response;
    })
  .then(data => {
    if(data.ok == false) {
      return;
    } else {
      let res = JSON.parse(data);
      dispatch('authorized', data);
    }
  })
}

</script>

<main>
  <form class="authentication-form">
    <div class="field">
      <label for="email">Email</label>
      <input type="text" name="email" bind:this={email} required>
    </div>
    <div class="field">
      <label for="password">Password</label>
      <input type="password" name="password" bind:this={password} required>
    </div>
    <button type="submit" class="button primary" on:click|preventDefault={authorize}>Submit</button>
  </form>
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