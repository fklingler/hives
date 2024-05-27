<script setup lang="ts">
import type { Hive } from '@/models/hive';
import { ref } from 'vue';
import { emitter } from '@/events';

// Define refs used in template
const hives = ref<Hive[]>([]);
const hivesError = ref<string | undefined>();
const hivesLoading = ref(false);

/**
 * Fetches hives and stores them in `hives` ref.
 */
async function fetchHives(): Promise<void> {
  hivesLoading.value = true;
  hivesError.value = undefined;

  try {
    const hivesResponse = await fetch(`${import.meta.env.VITE_SERVER_URL}/api/hives`);
    const hivesResult = await hivesResponse.json();

    hives.value = hivesResult;
  }
  catch (err) {
    // Simple error management, we will display it and let user retry
    console.error(err);
    hivesError.value = String(err);
  }
  finally {
    hivesLoading.value = false;
  }
}

// Fetch hives when loading this component
fetchHives();

// Subscribe to emitter to provide a way to refetch hives from other components
emitter.on('refreshHives', () => fetchHives());
</script>

<template>
  <p v-if="hivesLoading">Loading...</p>
  <p v-if="hivesError">
    Error: {{ hivesError }}
    <a @click="fetchHives()">Retry?</a>
  </p>

  <ul>
    <li v-for="hive in hives">
      <RouterLink :to="{ name: 'hive-detail', params: { id: hive.id } }"> 
        {{ hive.name }}
      </RouterLink>
    </li>
  </ul>
</template>
