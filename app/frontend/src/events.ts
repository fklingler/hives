import mitt from 'mitt';

type Events = {
    // Refreshes hives list in HivesList component
    refreshHives: undefined;
}

export const emitter = mitt<Events>();