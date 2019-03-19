import room from './dining-room.json';

const getRoom = () => new Promise((resolve) => setInterval(resolve, 2000, room))

export default getRoom;
