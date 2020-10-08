<script>

import { onMount } from 'svelte';
import { createEventDispatcher } from 'svelte';
import { getLocation, processAjaxData, sectionClick } from '../scripts.js';

export let params;

let firstName;
let lastName;
let email;
let password;
let passwordConfirmation;
let catererBusinessName;
let catererBusinessAddress;
let catererBusinessCity;
let catererBusinessState;
let zipCode;
let url;
let reqParams = {};
let body = {};

let dispatch = createEventDispatcher();

let register = (e) => {
  body = {
    user: {
      first_name: firstName.value,
      last_name: lastName.value,
      email: email.value,
      password: password.value,
      password_confirmation: passwordConfirmation.value,
      caterer_user: params == "caterer" ? true : false,
      caterer_business_address: catererBusinessAddress ? catererBusinessAddress.value : null,
      caterer_business_city: catererBusinessCity ? catererBusinessCity.value : null,
      caterer_business_state: catererBusinessState ? catererBusinessState.value : null,
      zip_code: zipCode ? zipCode.value : null
    }
  };

  let url = "/signup";
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
    };
  });
};

$: params;

let catererSignup = params == "caterer" || false;

async function navigate(e) {
  let result = await sectionClick(e);
  dispatch('loadPage', result);
}

</script>

<main>
  <form class="authentication-form">
    {#if params != "caterer"}
      <p>
        <a href="/signup/caterer" class="primary" on:click|preventDefault={navigate}>Click here to register as a Caterer</a>
      </p>
    {/if}
    <div class="fields_pair">
      <div class="field">
        <label for="first_name">First name</label>
        <input type="text" name="first_name" bind:this={firstName} required>
      </div>
      <div class="field">
        <label for="last_name">Last name</label>
        <input type="text" name="last_name" bind:this={lastName} required>
      </div>
    </div>
    <div class="field">
      <label for="email">Email</label>
      <input type="text" name="email" bind:this={email} required>
    </div>
    <div class="field">
      <label for="password">Password</label>
      <input type="password" name="password" bind:this={password} required>
    </div>
    <div class="field">
      <label for="password">Password confirmation</label>
      <input type="password" name="password_confirmation" bind:this={passwordConfirmation} required>
    </div>
    <input type="hidden" name="caterer_user" bind:value={catererSignup} />

    {#if params == "caterer"}
      <div class="field">
        <label for="business_name">Business name</label>
        <input type="text" name="business_name" bind:this={catererBusinessName} required>
      </div>
      <div class="field">
        <label for="address">Business address</label>
        <input type="text" name="address" bind:this={catererBusinessAddress} required>
      </div>
      <div class="fields_trio">
        <div class="field">
          <label for="city">City</label>
          <input type="text" name="city" bind:this={catererBusinessCity} required>
        </div>
        <div class="field">
          <label for="state">State</label>
          <input type="text" name="state" bind:this={catererBusinessState} required>
        </div>
        <div class="field">
          <label for="zip">Zip Code</label>
          <input type="text" name="zip" bind:this={zipCode} required>
        </div>
      </div>
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