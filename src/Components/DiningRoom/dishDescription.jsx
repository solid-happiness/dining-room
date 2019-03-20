const getDishDescription = ({ 
    calorific,
    proteins,
    fats,
    carbohydrates,
    price,
    portion,
}) => [
    `Цена: ${price / 100}р`,
    `К/Б/Ж/У: ${calorific / 1000}/${proteins}/${fats}/${carbohydrates}`,
    `Порция: ${portion}`,
];

export default getDishDescription;
