import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import styles from './login.module.css';

export const LoginPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const { login } = useAuth();
  const [email, setEmail] = useState('');
  const [pwd, setPwd] = useState('');

  const submit = (e) => {
    e.preventDefault();
    if (!email.includes('@')) { toast('Введите корректный email'); return; }
    if (pwd.length < 4) { toast('Пароль минимум 4 символа'); return; }
    login(email);
    toast('Вы вошли в аккаунт');
    nav('/');
  };

  return (
    <div className={styles.wrap}>
      <div className={styles.greet}>Добро пожаловать!</div>
      <h1 className={styles.title}>Войдите в свой аккаунт</h1>
      <form className={styles.form} onSubmit={submit}>
        <div>
          <label className={styles.label}>E-mail</label>
          <input className="input" placeholder="E-mail" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        </div>
        <div>
          <label className={styles.label}>Пароль</label>
          <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        </div>
        <div className={styles.row}>
          <label className={styles.check}><input type="checkbox" /> Запомнить меня</label>
          <Link to="/reset-password" className={styles.forgot}>Забыли пароль?</Link>
        </div>
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>Войти</button>
        <button type="button" className={styles.google}>
          <span>G</span> Или войдите с помощью Google
        </button>
      </form>
      <div className={styles.bottom}>
        У Вас все еще нет аккаунта? <Link to="/signup" className={styles.link}>Зарегистрируйтесь бесплатно!</Link>
      </div>
    </div>
  );
};
