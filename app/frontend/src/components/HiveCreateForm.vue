<script setup lang="ts">
import { ref } from 'vue';
import ValidationErrors from '@/components/ValidationErrors.vue';
import { emitter } from '@/events';

// Form inputs refs
const name = ref<string>('');
const weight = ref<number>(0);

// Submit refs
const serverErrors = ref();
const requestError = ref();
const submitting = ref(false);

async function handleSubmit(): Promise<void> {  
  // Don't submit if we are already submitting
  if (submitting.value) {
    return;
  }

  submitting.value = true;
  serverErrors.value = undefined;
  requestError.value = undefined;

  try {
    // Post the new model to the API
    const response = await fetch(`${import.meta.env.VITE_SERVER_URL}/api/hives`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: name.value,
        weight: weight.value
      })
    });

    // Handle the errors returned by the server if there are any
    // They will most likely be validation errors, that will be displayed with our
    // ValidationErrors component
    if (!response.ok) {
      serverErrors.value = await response.json();
    }
  }
  catch (err) {
    // If we have an error in the request itself, handle it very simply by displaying it
    console.error(err);
    requestError.value = err;
  }
  finally {
    submitting.value = false;
  }

  // When request is succesful, empty the form and refetch the hives list
  name.value = '';
  weight.value = 0;

  emitter.emit('refreshHives');
}
</script>

<template>
  <form @submit.prevent="handleSubmit">
    <label>
      Name:
      <input type="text" v-model="name" />
    </label>
    <ValidationErrors v-if="serverErrors" :errors="serverErrors" field="name" />

    <label>
      Weight (kg):
      <input type="number" v-model="weight" />
    </label>
    <ValidationErrors v-if="serverErrors" :errors="serverErrors" field="weight" />

    <button type="submit">{{ submitting ? 'Registering...' : 'Register' }}</button>
    <p v-if="requestError">
      Error: {{ requestError }}
    </p>
  </form>
</template>

<style scoped>
  form {
    display: flex;
    flex-direction: column;
  }
</style>