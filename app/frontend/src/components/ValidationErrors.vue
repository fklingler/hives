<script setup lang="ts">
defineProps<{
  errors: any;
  field: string;
}>();

/**
 * Format validation errors returned by Rails server
 * This is a simple implementation that covers our current use cases
 */
function formatErrors(errors: any, field: string): string {
    if (!errors[field]) {
        return '';
    }

    if (Array.isArray(errors[field])) {
        return errors[field].join('');
    }

    return String(errors)
}
</script>

<template>
    <p v-if="errors[field]">
        {{ formatErrors(errors, field) }}
    </p>
</template>

<style scoped>
p {
    color: #d76874;
}
</style>