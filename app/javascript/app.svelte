<script>

import { onMount } from "svelte";

import Welcome from './components/Welcome.svelte';
import SignUp from './components/SignUp.svelte';

export let page;
export let params;

page = 'signup';
$: params = '';

let loadPage = (e) => {
  page = e.detail.page;
  params = e.detail.params || '';
}

</script>

{#if page == 'home'}
  <Welcome on:loadPage={loadPage} />
{:else if page == 'signup'}
  <SignUp on:loadPage={loadPage} {params} />
{/if}