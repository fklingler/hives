<script setup lang="ts">
import type { Hive } from '@/models/hive';
import { ref } from 'vue';
import { useRoute } from 'vue-router';

const hiveId = useRoute().params.id;

// Define refs used in template
const hive = ref<Hive | undefined>(undefined);
const hiveError = ref<string | undefined>();
const hiveLoading = ref(false);

/**
 * Fetches hives and stores them in `hives` ref.
 */
async function fetchHive(): Promise<void> {
  hiveLoading.value = true;
  hiveError.value = undefined;

  try {
    const hiveResponse = await fetch(`${import.meta.env.VITE_SERVER_URL}/api/hives/${hiveId}`);
    const hiveResult = await hiveResponse.json();

    hive.value = hiveResult;
  }
  catch (err) {
    // Simple error management, we will display it and let user retry
    console.error(err);
    hiveError.value = String(err);
  }
  finally {
    hiveLoading.value = false;
  }
}

// Fetch hive when loading this component
fetchHive();
</script>

<template>
  <h2>{{ hive ? hive.name : 'Hive detail' }}</h2>

  <p v-if="hiveLoading">Loading...</p>
  <p v-if="hiveError">
    Error: {{ hiveError }}
    <a @click="fetchHive()">Retry?</a>
  </p>

  <template v-if="hive">
    <p>Weight: {{ hive.weight }}kg</p>
  </template>
</template>
