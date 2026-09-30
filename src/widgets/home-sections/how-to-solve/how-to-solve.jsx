import styles from './how-to-solve.module.css';

const STEPS = [
  { icon: '👤', title: 'Выберите услугу', text: 'В супермаркете WorkTap представлен широкий выбор услуг от квалифицированных специалистов.' },
  { icon: '💳', title: 'Оплатите', text: 'Деньги будут перечислены продавцу после того, как он выполнит работу, и вы её одобрите.' },
  { icon: '📄', title: 'Получите результат', text: 'Наш супермаркет гарантирует вам возврат средств в полном объёме в случае невыполнения заказа.' },
];

export const HowToSolve = () => (
  <section className={styles.section}>
    <div className="container">
      <h2 className="h2">Как решать задачи на WorkTap?</h2>
      <a href="/" className={styles.link}>Идеально подходит для бизнеса и частных лиц</a>
      <div className={styles.grid}>
        {STEPS.map((s, i) => (
          <div key={i}>
            <div className={styles.icon}>{s.icon}</div>
            <h3 className={styles.title}>{s.title}</h3>
            <p className={styles.text}>{s.text}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);
