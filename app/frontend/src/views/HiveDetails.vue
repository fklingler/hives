<script setup lang="ts">
import HiveDetails from '@/components/HiveDetails.vue'
</script>

<template>
  <main>
    <RouterLink :to="{ name: 'hives' }">Back to hives list</RouterLink>

    <HiveDetails />
  </main>
</template>
