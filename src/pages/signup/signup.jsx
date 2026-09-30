import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import styles from './signup.module.css';

export const SignupPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const { login } = useAuth();
  const [role, setRole] = useState('freelancer');

  const submit = (e) => {
    e.preventDefault();
    toast('Регистрация успешна!');
    login('new@user.kz');
    nav('/');
  };

  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Давайте создадим Вам аккаунт</div>
      <h1 className={styles.title}>Заполните все поля</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>Ваше имя</label>
          <input className="input" placeholder="Имя" />
        </div>
        <div>
          <label className={styles.label}>Ваше фамилия</label>
          <input className="input" placeholder="Фамилия" />
        </div>
        <div>
          <label className={styles.label}>E-mail</label>
          <input className="input" placeholder="E-mail" type="email" />
        </div>
        <div>
          <label className={styles.label}>Телефон номер</label>
          <input className="input" placeholder="Телефон" />
        </div>
        <div>
          <label className={styles.label}>Пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <div>
          <label className={styles.label}>Повтарите пароль</label>
          <input className="input" placeholder="Пароль" type="password" />
        </div>
        <div className={styles.roles}>
          <label className={styles.role}><input type="radio" checked={role === 'freelancer'} onChange={() => setRole('freelancer')} /> Я исполнитель</label>
          <label className={styles.role}><input type="radio" checked={role === 'client'} onChange={() => setRole('client')} /> Я заказчик</label>
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Зарегистрироваться</button>
      </form>
      <div className={styles.bottom}>
        У Вас есть аккаунт? <Link to="/login" className={styles.link}>Войдите</Link>
      </div>
    </div>
  );
};
