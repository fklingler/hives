<script setup lang="ts">
import { useRoute } from 'vue-router';

const id = useRoute().params.id;
</script>

<template>
  <main>
    Hive {{ id }}
  </main>
</template>
