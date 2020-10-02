<script>

import { onMount } from "svelte";

import Nav from './components/Nav.svelte';
import Welcome from './components/Welcome.svelte';
import SignUp from './components/SignUp.svelte';
import Login from './components/Login.svelte';

export let page;
export let params;
export let user = null;
$: user;

page = 'signup';
$: params = '';

let loadPage = (e) => {
  page = e.detail.page;
  params = e.detail.params || '';
}

let logUserIn = (e) => {
  user = JSON.parse(e.detail);
  page = 'home';
}

onMount(() => {
  let currentLocation = window.location.pathname.split('/').slice(1);
  if (currentLocation[0] == "") {
    page = 'home'
  } else {
    page = currentLocation[0]
    params = currentLocation.slice(1);
  };
});

</script>

<Nav {params} on:loadPage={loadPage} />
{#if page == 'home'}
  <Welcome on:loadPage={loadPage} {user} />
{:else if page == 'signup'}
  <SignUp on:loadPage={loadPage} {params} on:authorized={logUserIn} />
{:else if page == 'sign_in'}
  <Login on:authorized={logUserIn} />
{/if}