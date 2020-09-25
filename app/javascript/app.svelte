<script>

import { onMount } from "svelte";

import Welcome from './components/Welcome.svelte';
import SignUp from './components/SignUp.svelte';

export let page;

page = 'signup';

let loadPage = (e) => {
  page = e.detail;
}

</script>

{#if page == 'home'}
  <Welcome on:loadPage={loadPage} />
{:else if page == 'signup'}
  <SignUp on:loadPage={loadPage} />
{/if}