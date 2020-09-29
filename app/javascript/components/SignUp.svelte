<script>

import { onMount } from 'svelte';
import { createEventDispatcher } from 'svelte';

export let params;

let firstName;
let lastName;
let email;
let password;
let passwordConfirmation;
let catererUser;
let catererBusinessName;
let catererBusinessAddress;
let catererBusinessCity;
let catererBusinessState;
let zipCode;
let url;
let reqParams = {};
let body = {};

let catererSignup = false;

$: params;

let dispatch = createEventDispatcher();

let register = (e) => {

  let reqBody = {
    user: {
      first_name: firstName.value,
      last_name: lastName.value,
      email: email.value,
      password: password.value,
      password_confirmation: passwordConfirmation.value,
      caterer_user: catererSignup,
    }
  }

  let url = "/users";
  let reqParams = {
    method: 'POST',
    body: JSON.stringify(reqBody),
    headers: { "Content-Type": "application/json" }
  };
  fetch(url, reqParams)
  .then(response => {return response.text()})
  .then(data => {
    let res = JSON.parse(data);
    console.log(res);
  })
}

let catererSignUpToggle = () => {
  if (catererSignup == false) catererSignup = true
  else catererSignup = false;
}

</script>

  
<main>
  <form class="authentication-form">
    {#if catererSignup == false}
      <p>
        <a href="/signup/caterer" class="primary" on:click|preventDefault={catererSignUpToggle}>Click here to register as a Caterer</a>
      </p>
    {/if}
    <div class="fields_pair">
      <div class="field">
        <label for="first_name">First name</label>
        <input type="text" name="first_name" bind:this={firstName}>
      </div>
      <div class="field">
        <label for="last_name">Last name</label>
        <input type="text" name="last_name" bind:this={lastName}>
      </div>
    </div>
    <div class="field">
      <label for="email">Email</label>
      <input type="text" name="email" bind:this={email}>
    </div>
    <div class="field">
      <label for="password">Password</label>
      <input type="password" name="password" bind:this={password}>
    </div>
    <div class="field">
      <label for="password">Password confirmation</label>
      <input type="password" name="password_confirmation" bind:this={passwordConfirmation}>
    </div><!--field-->
    <input type="hidden" name="caterer_user" bind:value={catererSignup} />
    {#if catererSignup == true}
      <div class="field">
        <label for="business_name">Business name</label>
        <input type="text" name="business_name" bind:this={catererBusinessName}>
      </div><!--field-->
      <div class="field">
        <label for="address">Business address</label>
        <input type="text" name="address" bind:this={catererBusinessAddress}>
      </div><!--field-->
      <div class="fields_trio">
        <div class="field">
          <label for="city">City</label>
          <input type="text" name="city" bind:this={catererBusinessCity}>
        </div><!--field-->
        <div class="field">
          <label for="state">State</label>
          <input type="text" name="state" bind:this={catererBusinessState}>
        </div><!--field-->
        <div class="field">
          <label for="zip">Zip Code</label>
          <input type="text" name="zip" bind:this={zipCode}>
        </div><!--field-->
      </div><!--fields_trio-->
    {/if}
    <button type="submit" class="button primary" on:click|preventDefault={register}>Submit</button>
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