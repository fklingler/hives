<script setup lang="ts">
import HiveCreateForm from '@/components/HiveCreateForm.vue';
import HivesList from '@/components/HivesList.vue';
</script>

<template>
  <main>
    <h2>Register a hive?</h2>

    <HiveCreateForm />

    <h2>Hives</h2>

    <HivesList />
  </main>
</template>
